require 'rails_helper'

RSpec.describe "Schedules", type: :request do
  describe "GET /index" do
    it 'ensure success status' do
      FactoryBot.create :saloon, name: 'Saloon1', gstin: 'GSTIN1', pan: 'PAN1', address: 'Address1'
      FactoryBot.create :service, saloon_id: 1, name: 'Hair cut', duration: 30, cost: 100.00
      FactoryBot.create :chair, saloon_id: 1, saloon_chair_id: 1
      FactoryBot.create :chair, saloon_id: 1, saloon_chair_id: 2
      FactoryBot.create :schedule, saloon_id: 1, week_day: Time.current.wday-1, open_time: "10:00", close_time: "18:00"
      FactoryBot.create :schedule, saloon_id: 1, week_day: Time.current.wday, open_time: "10:00", close_time: "18:00"

      get '/saloons/1/schedules'

      expect(response).to have_http_status(:success)
    end

  end

  describe "GET /show" do
    it 'ensure single instance success status' do
      FactoryBot.create :saloon, name: 'Saloon1', gstin: 'GSTIN1', pan: 'PAN1', address: 'Address1'
      FactoryBot.create :service, saloon_id: 1, name: 'Hair cut', duration: 30, cost: 100.00
      FactoryBot.create :chair, saloon_id: 1, saloon_chair_id: 1
      FactoryBot.create :chair, saloon_id: 1, saloon_chair_id: 2
      FactoryBot.create :schedule, saloon_id: 1, week_day: Time.current.wday-1, open_time: "10:00", close_time: "18:00"
      FactoryBot.create :schedule, saloon_id: 1, week_day: Time.current.wday, open_time: "10:00", close_time: "18:00"

      get '/saloons/1/schedules/1'

      expect(response).to have_http_status(:success)
    end

  end

  describe "POST /create" do
    it 'create a new schedule' do
      FactoryBot.create :saloon, name: 'Saloon1', gstin: 'GSTIN1', pan: 'PAN1', address: 'Address1'
      FactoryBot.create :service, saloon_id: 1, name: 'Hair cut', duration: 30, cost: 100.00
      FactoryBot.create :chair, saloon_id: 1, saloon_chair_id: 1
      FactoryBot.create :chair, saloon_id: 1, saloon_chair_id: 2
      post '/saloons/1/schedules', params: { schedule: { saloon_id: 1, week_day: Time.current.wday+1, open_time: "10:00", close_time: "18:00"}}
      data = JSON.parse(response.body)
      expect(response).to have_http_status(:created)
    end

  end
end
