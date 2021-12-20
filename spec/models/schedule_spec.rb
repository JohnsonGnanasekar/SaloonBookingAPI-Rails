require 'rails_helper'
#t.integer :saloon_id, :null => false
#t.integer :week_day, :null => false
#t.time :open_time, :null => false
#t.time :close_time, :null => false
RSpec.describe Schedule, type: :model do
  context 'validation tests' do
   it 'ensure saloon_id presence' do
     saloon = Saloon.new(name: 'Saloon1', gstin: "GSTIN1", pan: "PAN1", address: "Address1").save
     schedule = Schedule.new(week_day: 1, open_time: '10:00', close_time: '18:00').save
     expect(schedule).to eq(false)
   end

   it 'ensure week_day presence' do
     saloon = Saloon.new(name: 'Saloon1', gstin: "GSTIN1", pan: "PAN1", address: "Address1").save
     schedule = Schedule.new(saloon_id: saloon, open_time: '10:00', close_time: '18:00').save
     expect(schedule).to eq(false)
   end

   it 'ensure open_time presence' do
     saloon = Saloon.new(name: 'Saloon1', gstin: "GSTIN1", pan: "PAN1", address: "Address1").save
     schedule = Schedule.new(saloon_id: saloon, week_day: 1, close_time: '18:00').save
     expect(schedule).to eq(false)
   end

   it 'ensure close_time presence' do
     saloon = Saloon.new(name: 'Saloon1', gstin: "GSTIN1", pan: "PAN1", address: "Address1").save
     schedule = Schedule.new(saloon_id: saloon, week_day: 1, open_time: '10:00').save
     expect(schedule).to eq(false)
   end

    it 'saved correctly' do
      saloon = Saloon.new(name: 'Saloon1', gstin: "GSTIN1", pan: "PAN1", address: "Address1").save

      schedule = Schedule.new(saloon_id: saloon, week_day: 1, open_time: '10:00', close_time: '18:00').save
      expect(schedule).to eq(true)
    end
  end

  context 'context tests' do

  end

end
