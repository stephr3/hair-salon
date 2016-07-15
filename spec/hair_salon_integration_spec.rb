require('spec_helper.rb')
require('capybara/rspec')
require('./app')
require('launchy')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('add a stylist path', {:type => :feature}) do
  it('gets to the add a stylist page') do
    visit '/'
    click_link 'Add a Stylist'
    expect(page).to have_content('Add Stylist')
  end

  it('allows the user to add a stylist') do
    visit '/stylists/new'
    fill_in('name', :with => 'Mary Poppins')
    fill_in('phone', :with => '360-458-7633')
    fill_in('specialty', :with => 'perms')
    click_button('Add Stylist')
    expect(page).to have_content("Stylist Roster")
  end
end
