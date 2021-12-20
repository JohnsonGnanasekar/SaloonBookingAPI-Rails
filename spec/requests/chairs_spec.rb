require 'rails_helper'

RSpec.describe "Chairs", type: :request do
  describe "GET /index" do
    it 'ensure success status' do
      FactoryBot.create :saloon, name: 'Saloon1', gstin: 'GSTIN1', pan: 'PAN1', address: 'Address1'
      FactoryBot.create :service, saloon_id: 1, name: 'Hair cut', duration: 30, cost: 100.00
      FactoryBot.create :chair, saloon_id: 1, saloon_chair_id: 1
      FactoryBot.create :chair, saloon_id: 1, saloon_chair_id: 2

      get '/saloons/1/chairs'

      expect(response).to have_http_status(:success)
    end

  end

  describe "GET /show" do
    it 'ensure single instance success status' do
      FactoryBot.create :saloon, name: 'Saloon1', gstin: 'GSTIN1', pan: 'PAN1', address: 'Address1'
      FactoryBot.create :service, saloon_id: 1, name: 'Hair cut', duration: 30, cost: 100.00
      FactoryBot.create :chair, saloon_id: 1, saloon_chair_id: 1
      FactoryBot.create :chair, saloon_id: 1, saloon_chair_id: 2

      get '/saloons/1/chairs/1'

      expect(response).to have_http_status(:success)
    end

  end

  describe "POST /create" do
    it 'create a new chair' do
      FactoryBot.create :saloon, name: 'Saloon1', gstin: 'GSTIN1', pan: 'PAN1', address: 'Address1'
      post '/saloons/1/chairs', params: { chair: { saloon_id: 1, saloon_chair_id: 1}}
      data = JSON.parse(response.body)
      expect(response).to have_http_status(:created)
    end

  end
end
