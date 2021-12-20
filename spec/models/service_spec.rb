require 'rails_helper'

RSpec.describe Service, type: :model do
  #t.integer :saloon_id, :null => false
  #t.string :name, :null => false
  #t.integer :duration, :null => false
  #t.decimal :cost, :null => false
  #
  context 'Validation tests' do
    it 'ensure saloon_id presence' do
      saloon = Saloon.new(name: 'Saloon1', gstin: "GSTIN1", pan: "PAN1", address: "Address1").save
      service = Service.new(name: 'Service1', duration: 30, cost: 100.00).save
      expect(service).to eq(false)
    end

    it 'ensure name presence' do
      saloon = Saloon.new(name: 'Saloon1', gstin: "GSTIN1", pan: "PAN1", address: "Address1").save
      service = Service.new(saloon_id: saloon, duration: 30, cost: 100.00).save
      expect(service).to eq(false)
    end

    it 'ensure duration presence' do
      saloon = Saloon.new(name: 'Saloon1', gstin: "GSTIN1", pan: "PAN1", address: "Address1").save
      service = Service.new(saloon_id: saloon, name: 'Service1', cost: 100.00).save
      expect(service).to eq(false)
    end

    it 'ensure cost presence' do
      saloon = Saloon.new(name: 'Saloon1', gstin: "GSTIN1", pan: "PAN1", address: "Address1").save
      service = Service.new(saloon_id: saloon, name: 'Service1', duration: 30).save
      expect(service).to eq(false)
    end

    it 'ensure save correctly' do
      saloon = Saloon.new(name: 'Saloon1', gstin: "GSTIN1", pan: "PAN1", address: "Address1").save
      service = Service.new(saloon_id: saloon, name: 'Service1', duration: 30, cost: 100.00).save
      expect(service).to eq(true)
    end
  end

end
