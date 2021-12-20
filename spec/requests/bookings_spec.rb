require 'rails_helper'

RSpec.describe "Bookings", type: :request do
  describe 'GET /report' do
    it 'ensure get summary report' do
      get '/bookings/report'
      expect(response).to have_http_status(:success)
    end
  end


end
