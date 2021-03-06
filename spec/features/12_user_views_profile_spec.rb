require 'rails_helper'

RSpec.describe "User visits profile page" do
  scenario "User sees profile information" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    truck = FactoryGirl.create(:truck)

    visit "/"
    name = "#{user.first_name} #{user.last_name}"
    click_on name

    expect(page).to have_css("img[src='#{user.avatar}']")
    expect(page).to have_css("img[alt='Profile Image']")
    expect(page).to have_content(user.first_name)
    expect(page).to have_content(user.last_name)
    expect(page).to have_content(user.email)
  end
end
