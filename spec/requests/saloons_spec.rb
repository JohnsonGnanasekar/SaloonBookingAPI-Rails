require 'rails_helper'

RSpec.describe "Saloons API", type: :request do
  describe "GET /index" do
    it 'ensure success status' do
      get '/saloons'

      expect(response).to have_http_status(:success)
    end

    it 'ensure returns all saloons' do
      FactoryBot.create :saloon, name: 'Saloon1', gstin: 'GSTIN1', pan: 'PAN1', address: 'Address1'
      FactoryBot.create :saloon, name: 'Saloon2', gstin: 'GSTIN1', pan: 'PAN1', address: 'Address1'
      FactoryBot.create :saloon, name: 'Saloon3', gstin: 'GSTIN1', pan: 'PAN1', address: 'Address1'

      get '/saloons'
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end
  describe "GET saloon Show" do
    it 'ensure success status of saloon show' do
      FactoryBot.create :saloon, name: 'Saloon1', gstin: 'GSTIN1', pan: 'PAN1', address: 'Address1'

      get '/saloons/1'
      expect(response).to have_http_status(:success)
    end

    it 'ensure show return correct single saloon information' do
      FactoryBot.create :saloon, name: 'Saloon1', gstin: 'GSTIN1', pan: 'PAN1', address: 'Address1'

      get '/saloons/1'
      data = JSON.parse(response.body)
      data["name"].should == "Saloon1"
    end
  end
  describe "Post /saloons" do
    it 'create a new saloon' do
      post '/saloons', params: { saloon: { name: "Saloon1", gstin: "GST", pan: "PAN", address: "Address1"}}
      data = JSON.parse(response.body)
      puts data.inspect
      expect(response).to have_http_status(:created)
    end
  end
end
