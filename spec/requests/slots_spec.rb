require 'rails_helper'

RSpec.describe "Slots", type: :request do
  describe "GET /index" do
    it 'ensure slots available success' do
      FactoryBot.create :saloon, name: 'Saloon1', gstin: 'GSTIN1', pan: 'PAN1', address: 'Address1'
      FactoryBot.create :service, saloon_id: 1, name: 'Hair cut', duration: 30, cost: 100.00
      FactoryBot.create :chair, saloon_id: 1, saloon_chair_id: 1
      FactoryBot.create :schedule, saloon_id: 1, week_day: Time.current.wday, open_time: "10:00", close_time: "18:00"


      get '/saloons/1/services/1/slots'
      data = JSON.parse(response.body)
      puts data.inspect
      expect(response).to have_http_status(:success)
    end
  end
end
