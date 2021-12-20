class SchedulesController < ApplicationController
  def index
    render json: Schedule.availableSchedulesForSaloon(params[:saloon_id])
  end

  def show
    render json: Schedule.find(params[:id])
  end

  def create
    schedule = Schedule.new(schedule_params)
    if schedule.save
      slots = createSlots schedule
      chairs = Chair.where(saloon_id: schedule.saloon_id)
      scheduleslots = createScheduleSlots(slots, chairs)
      render json: schedule, status: :created
    else
      render json: schedule.errors, status: :unprocessable_entity
    end
  end

  private
  def schedule_params
    params.require(:schedule).permit(:saloon_id,:week_day, :open_time, :close_time)
  end

  def createSlots (schedule)
    opentime = schedule.open_time
    closetime = schedule.close_time
    newstarttime = opentime

    while (newstarttime < closetime)
      newendtime = newstarttime.advance(minutes: 29)
      slot = Slot.new(schedule_id: schedule.id, start_time: newstarttime, end_time: newendtime)
      if slot.save
        newstarttime = newendtime.advance(minutes: 1)
      else
        newstarttime = closetime
      end
    end
    slots = Slot.where(schedule_id: schedule.id)

  end

  def createScheduleSlots(slots, chairs)
    slots.each do |slot|
      chairs.each do |chair|
        scheduleSlot = ScheduleSlot.new(schedule_id: slot.schedule_id, slot_id: slot.id, chair_id: chair.id)
        unless scheduleSlot.save
          break
        end
      end
    end
  end


end
