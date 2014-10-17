frequire 'rails_helper'

RSpec.describe UsersController, :type => :controller do

	describe 'GET #login' do 
		it "renders user login form page" do
			get :login
			expect(response).to render_template :login
		end
	end

end