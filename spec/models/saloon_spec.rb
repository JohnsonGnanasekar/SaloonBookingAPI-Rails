require 'rails_helper'

RSpec.describe Saloon, type: :model do
  context 'validation tests' do
    it 'ensure name presence' do
      saloon = Saloon.new(gstin: "GSTIN1" ,address: "Address1").save
      expect(saloon).to eq(false)
    end
    it 'ensure address presence' do
      saloon = Saloon.new(name: 'Saloon1', gstin: "GSTIN1").save
      expect(saloon).to eq(false)
    end

    it 'should save correctly' do
      saloon = Saloon.new(name: 'Saloon1', gstin: "GSTIN1", pan: "PAN1", address: "Address1").save
      expect(saloon).to eq(true)
    end

  end
  context 'scope tests' do

  end
end
