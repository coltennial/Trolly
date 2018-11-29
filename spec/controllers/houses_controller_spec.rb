require 'rails_helper'

RSpec.describe HousesController, type: :controller do
  login_user 
let(:valid_attributes) {
  { city: "taylorsville", price: 300000, mobile: true }
}
let(:invalid_attributes) {
  { city: "taylorsville", price: 300000, mobile: true }
}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

end
