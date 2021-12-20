require 'rails_helper'

RSpec.describe Booking, type: :model do
  #t.integer :saloon_id, :null => false
  #t.integer :chair_id, :null => false
  #t.integer :service_id, :null => false
  #t.date :date, :null => false
  #t.time :start_time, :null => false
  #t.time :end_time, :null => false
  context 'Validation tests' do
    it 'ensure saloon_id presence' do
      saloon = Saloon.new(name: 'Saloon1', gstin: "GSTIN1", pan: "PAN1", address: "Address1").save
      chair = Chair.new(saloon_id: saloon, saloon_chair_id: 1).save
      service = Service.new(saloon_id: saloon, name: 'Service1', duration: 30, cost: 100.00).save
      booking = Booking.new(chair_id: chair, service_id: service, date: Date.today, start_time: Time.parse('10:00'), end_time: Time.parse('10.29')).save
      expect(booking).to eq(false)
    end

    it 'ensure chair_id presence' do
      saloon = Saloon.new(name: 'Saloon1', gstin: "GSTIN1", pan: "PAN1", address: "Address1").save
      chair = Chair.new(saloon_id: saloon, saloon_chair_id: 1).save
      service = Service.new(saloon_id: saloon, name: 'Service1', duration: 30, cost: 100.00).save
      booking = Booking.new(saloon_id: saloon, service_id: service, date: Date.today, start_time: Time.parse('10:00'), end_time: Time.parse('10.29')).save
      expect(booking).to eq(false)
    end

    it 'ensure service_id presence' do
      saloon = Saloon.new(name: 'Saloon1', gstin: "GSTIN1", pan: "PAN1", address: "Address1").save
      chair = Chair.new(saloon_id: saloon, saloon_chair_id: 1).save
      service = Service.new(saloon_id: saloon, name: 'Service1', duration: 30, cost: 100.00).save
      booking = Booking.new(saloon_id: saloon, chair_id: chair, date: Date.today, start_time: Time.parse('10:00'), end_time: Time.parse('10.29')).save
      expect(booking).to eq(false)
    end

    it 'ensure date presence' do
      saloon = Saloon.new(name: 'Saloon1', gstin: "GSTIN1", pan: "PAN1", address: "Address1").save
      chair = Chair.new(saloon_id: saloon, saloon_chair_id: 1).save
      service = Service.new(saloon_id: saloon, name: 'Service1', duration: 30, cost: 100.00).save
      booking = Booking.new(saloon_id: saloon, chair_id: chair, service_id: service, start_time: Time.parse('10:00'), end_time: Time.parse('10.29')).save
      expect(booking).to eq(false)
    end

    it 'ensure start_time presence' do
      saloon = Saloon.new(name: 'Saloon1', gstin: "GSTIN1", pan: "PAN1", address: "Address1").save
      chair = Chair.new(saloon_id: saloon, saloon_chair_id: 1).save
      service = Service.new(saloon_id: saloon, name: 'Service1', duration: 30, cost: 100.00).save
      booking = Booking.new(saloon_id: saloon, chair_id: chair, service_id: service, date: Date.today, end_time: Time.parse('10.29')).save
      expect(booking).to eq(false)
    end

    it 'ensure end_time presence' do
      saloon = Saloon.new(name: 'Saloon1', gstin: "GSTIN1", pan: "PAN1", address: "Address1").save
      chair = Chair.new(saloon_id: saloon, saloon_chair_id: 1).save
      service = Service.new(saloon_id: saloon, name: 'Service1', duration: 30, cost: 100.00).save
      booking = Booking.new(saloon_id: saloon, chair_id: chair, service_id: service, date: Date.today, start_time: Time.parse('10:00')).save
      expect(booking).to eq(false)
    end

    it 'ensure save correctly' do
      saloon = Saloon.new(name: 'Saloon1', gstin: "GSTIN1", pan: "PAN1", address: "Address1").save
      chair = Chair.new(saloon_id: saloon, saloon_chair_id: 1).save
      service = Service.new(saloon_id: saloon, name: 'Service1', duration: 30, cost: 100.00).save
      booking = Booking.new(saloon_id: saloon, chair_id: chair, service_id: service, date: Date.today, start_time: Time.parse('10:00'), end_time: Time.parse('10.29'), cost: 100.00).save
      expect(booking).to eq(true)
    end
  end

end
