require 'rails_helper'

RSpec.describe "ValidationCodes", type: :request do
  describe "POST /validation_codes" do
    it "create" do
      post '/api/v1/validation_codes', params: {email: 'aaa@bbb.com'}
      expect(response).to have_http_status(200)
    end
  end
end
