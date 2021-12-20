class BookingsController < ApplicationController
  before_action :locateSaloon , only: [:create]
  before_action :locateService, only: [:create]
  before_action :locateSchedule, only: [:create]
  before_action :locateSlots, only: [:create]



  def create
    availableScheduleSlots = findScheduleSlots
    puts availableScheduleSlots.inspect

    booking = Booking.new(saloon_id: @saloon.id, chair_id: @chair_id, service_id: @service.id, date: Date.today, start_time: @slot.start_time, end_time: @slot.start_time.advance(minutes: @service.duration - 1))
    if booking.save
      availableScheduleSlots.each do |scheduleSlot|
        scheduleSlot.book_status = 1
        if scheduleSlot.save
          bookingslot = BookingSlot.new(booking_id: booking.id, schedule_slot_id: scheduleSlot.id)
          if bookingslot.save
            puts "Success"
          else
            puts bookingslot.errors.inspect
          end


        end
      end
      render json: booking, status: :created
    else
      render json: booking.errors, status: :unprocessable_entity
    end


  end

  def report
    first_of_month = Date.current.beginning_of_month
    last_of_next_month = Date.current.end_of_month
    total_booked_service = Booking.where('date BETWEEN ? AND ?', first_of_month, last_of_next_month).size
    total_revenue = Booking.where('date BETWEEN ? AND ?', first_of_month, last_of_next_month).sum(:cost)
    render json: { :total_no_of_booked_service => total_booked_service, :total_revenue => total_revenue}


  end

  private

  def booking_params
    params.require(:booking).permit(:saloon_id, :service_id, :slot_id, :start_time)
  end

  def locateSaloon
    @saloon = Saloon.find(params[:booking][:saloon_id])
  end

  def locateService
    @service = Service.find(params[:booking][:service_id])

  end

  def locateSchedule
    @schedule = Schedule.availableScheduleForSaloonForToday(@saloon.id)
  end


  def locateSlots
    @slot = Slot.find(params[:booking][:slot_id])

  end

  def findScheduleSlots
    duration = @service.duration
    starttime = @slot.start_time

    endtime = starttime.advance(minutes: duration - 1)
    slotsRequired = duration / 30
    mod = duration % 30
    if mod > 0
      slotsRequired = slotsRequired + 1
    end
    availableSlotsIds = Slot.where("schedule_id = ? AND start_time >= ? AND end_time <= ?", @slot.schedule_id, starttime, endtime).pluck(:id)
    if slotsRequired > availableSlotsIds.length
      return
    end
    availableChairIds = ScheduleSlot.availableScheduleSlot.where(slot_id: availableSlotsIds).distinct.pluck(:chair_id)

    availableChairIds.each do |chairId|
      availableScheduleSlotcount = ScheduleSlot.availableScheduleSlot.where(slot_id: availableSlotsIds, chair_id: chairId).size
      if slotsRequired = availableScheduleSlotcount
        @chair_id = chairId
        return ScheduleSlot.availableScheduleSlot.where(slot_id: availableSlotsIds, chair_id: chairId).order(id: :asc)
      end
    end

  end
end
