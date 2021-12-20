class ChairsController < ApplicationController
  def index
    render json: Chair.availableChairsForSaloon(params[:saloon_id])
  end

  def show
    render json: Chair.find(params[:id])
  end

  def create
    chair = Chair.new(chair_params)
    if chair.save
      schedules = Schedule.availableSchedulesForSaloon(chair.saloon_id)
      createScheduleSlots(schedules, chair)
      render json: chair, status: :created
    else
      render json: chair.errors, status: :unprocessable_entity
    end
  end

  private

  def chair_params
    params.require(:chair).permit(:saloon_id, :saloon_chair_id)
  end

  def createScheduleSlots(schedules, chair)
    schedules.each do |schedule|
      slots = Slot.where(schedule_id: schedule.id)
      slots.each do |slot|
        scheduleSlot = ScheduleSlot.new(schedule_id: slot.schedule_id, slot_id: slot.id, chair_id: chair.id)
        unless scheduleSlot.save
          break
        end
      end
    end
  end
end
