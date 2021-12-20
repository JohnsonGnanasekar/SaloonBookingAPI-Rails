require 'rails_helper'

RSpec.describe Chair, type: :model do
  #t.integer :saloon_id, :null => false
  #t.integer :saloon_chair_id, :null => false
  context 'validation tests' do
    it 'ensure saloon_id presence' do
      saloon = Saloon.new(name: 'Saloon1', gstin: "GSTIN1", pan: "PAN1", address: "Address1").save
      chair = Chair.new(saloon_chair_id: 1).save
      expect(chair).to eq(false)
    end

    it 'ensure saloon_chair_id presence' do
      saloon = Saloon.new(name: 'Saloon1', gstin: "GSTIN1", pan: "PAN1", address: "Address1").save
      chair = Chair.new(saloon_id: saloon).save
      expect(chair).to eq(false)
    end

    it 'ensure save correctly' do
      saloon = Saloon.new(name: 'Saloon1', gstin: "GSTIN1", pan: "PAN1", address: "Address1").save
      chair = Chair.new(saloon_id: saloon, saloon_chair_id: 1).save
      expect(chair).to eq(true)
    end

  end

end
