require 'rails_helper'

RSpec.describe "Items", type: :request do
  describe "测get" do
    it "测测测" do
      11.times {Item.create amount: 100}
      expect(Item.count).to eq 11

      get '/api/v1/items'
      expect(response).to have_http_status 200
      json = JSON.parse(response.body)
      expect(json['resource'].size).to eq 10
      
      get '/api/v1/items?page=2'
      json = JSON.parse(response.body)
      expect(json['resource'].size).to eq 1
      
      get '/api/v1/items?page_size=20'
      json = JSON.parse(response.body)
      expect(json['resource'].size).to eq 11
    end
  end
  describe '测create' do
    it "测" do
      expect {
        post "/api/v1/items", params: {amount: 11}
      }.to change {Item.count}.by +1
      expect(response).to have_http_status 200
      json = JSON.parse(response.body)
      p json
      expect(json['resource']['id']).to be_an(Numeric)
      expect(json['resource']['amount']).to eq 11
    end
  end
end
