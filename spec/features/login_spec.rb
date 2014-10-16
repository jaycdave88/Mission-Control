
require 'capybara/rspec'

feature "User can log into app" do
	scenario "on click user will be brought to login form" do
		visit '/user/login'
		expect(page).to have_content 'Login'
	end
end

