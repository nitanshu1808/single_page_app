require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  it "get index and has a 200 status code" do
    get :index
    expect(response.status).to eq(200)
  end
end
