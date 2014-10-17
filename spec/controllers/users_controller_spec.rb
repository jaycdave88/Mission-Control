require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

	describe 'GET #login' do
		it "renders user login form page" do
			get :login
			expect(response).to render_template :login
		end
	end

  describe 'GET #signup' do
    it "renders user signup form page" do
      get :new
      expect(response.status).to eq(200)
    end
  end

end