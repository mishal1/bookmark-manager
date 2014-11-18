require 'spec_helper'

feature "User signs up" do

	scenario "when being logged out" do
		expect{sign_up}.to change(User, :count).by(1)
		expect(page).to have_content("Welcome, mishal@example.com")
		expect(User.first.email).to eq("mishal@example.com")
	end

	def sign_up(email = "mishal@example.com",
				password = "123")
		visit "/users"
		expect(page.status_code).to eq(200)
		fill_in(:email, :with=> email)
		fill_in(:password, :with=> password)
		click_button('Sign up')

	end

end