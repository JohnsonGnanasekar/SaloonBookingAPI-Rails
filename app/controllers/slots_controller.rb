class SlotsController < ApplicationController
  def index

    render json: getAvailableSlots
  end


  def slots_params
    params.permit(:saloon_id,:service_id)
  end

  def getAvailableSlots
    schedule = Schedule.availableScheduleForSaloonForToday(params[:saloon_id])
    availableSlotsId = ScheduleSlot.where(schedule_id: schedule, book_status: 0).pluck(:slot_id)
    availableSlots = Slot.where(id: availableSlotsId)
  end
end
