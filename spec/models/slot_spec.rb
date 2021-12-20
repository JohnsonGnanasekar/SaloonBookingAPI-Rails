require 'rails_helper'

RSpec.describe Slot, type: :model do
  #t.integer :schedule_id, :null => false
  #t.time :start_time, :null => false
  #t.time :end_time, :null => false
  context 'validation tests' do
    it 'ensure schedule_id presence' do
      saloon = Saloon.new(name: 'Saloon1', gstin: "GSTIN1", pan: "PAN1", address: "Address1").save
      schedule = Schedule.new(saloon_id: saloon, week_day: 1, open_time: '10:00', close_time: '18:00').save
      slot = Slot.new(start_time: '10:00', end_time: '10:29').save
      expect(slot).to eq(false)
    end

    it 'ensure start_time presence' do
      saloon = Saloon.new(name: 'Saloon1', gstin: "GSTIN1", pan: "PAN1", address: "Address1").save
      schedule = Schedule.new(saloon_id: saloon, week_day: 1, open_time: '10:00', close_time: '18:00').save
      slot = Slot.new(schedule_id: schedule, end_time: '10:29').save
      expect(slot).to eq(false)
    end

    it 'ensure end_time presence' do
      saloon = Saloon.new(name: 'Saloon1', gstin: "GSTIN1", pan: "PAN1", address: "Address1").save
      schedule = Schedule.new(saloon_id: saloon, week_day: 1, open_time: '10:00', close_time: '18:00').save
      slot = Slot.new(schedule_id: schedule, start_time: '10:00').save
      expect(slot).to eq(false)
    end
  end

  it 'ensure save correctly' do
    saloon = Saloon.new(name: 'Saloon1', gstin: "GSTIN1", pan: "PAN1", address: "Address1").save
    schedule = Schedule.new(saloon_id: saloon, week_day: 1, open_time: '10:00', close_time: '18:00').save
    slot = Slot.new(schedule_id: schedule, start_time: '10:00', end_time: '10:29').save
    expect(slot).to eq(true)
  end

  context "context tests" do

  end

end
