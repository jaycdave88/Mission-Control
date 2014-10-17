
require 'capybara/rspec'

feature "User can log into app" do
	
	# before :each do
	# 	visit '/user/login'
	# end

	scenario "on click user will be brought to login form" do

		visit root_path
		click_link 'Log In'
		expect(page).to have_content 'Login'
	end

	scenario "user can fill out form to log in" do
		user = User.create(name: "Bob", email: "bob@gmail.com", phase: '1', password: "ilovecookies")

		visit '/user/login'
		fill_in 'Email', with: user.email
		fill_in 'Password', with: user.password
		click_button 'Log In'

	end


end

