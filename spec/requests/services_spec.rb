require 'rails_helper'

RSpec.describe "Services", type: :request do
  describe "GET /services" do
    it 'ensure success status' do
      FactoryBot.create :saloon, name: 'Saloon1', gstin: 'GSTIN1', pan: 'PAN1', address: 'Address1'
      FactoryBot.create :service, saloon_id: 1, name: 'Hair cut', duration: 30, cost: 100.00
      FactoryBot.create :service, saloon_id: 1, name: 'Hair coloring', duration: 60, cost: 200.00

      get '/saloons/1/services'

      expect(response).to have_http_status(:success)
    end


  end

  describe "GET /services/id" do
    it 'ensure single service success status' do
      FactoryBot.create :saloon, name: 'Saloon1', gstin: 'GSTIN1', pan: 'PAN1', address: 'Address1'
      FactoryBot.create :service, saloon_id: 1, name: 'Hair cut', duration: 30, cost: 100.00
      FactoryBot.create :service, saloon_id: 1, name: 'Hair coloring', duration: 60, cost: 200.00
      get '/saloons/1/services/1'

      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /Service' do
    it 'create a new Service' do
      FactoryBot.create :saloon, name: 'Saloon1', gstin: 'GSTIN1', pan: 'PAN1', address: 'Address1'
      post '/saloons/1/services', params: { service: { saloon_id: 1, name: "Hair Wash", duration: 30, cost: 100.00 }}
      data = JSON.parse(response.body)
      expect(response).to have_http_status(:created)
    end

  end


end
