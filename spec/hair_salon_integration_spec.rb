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
end
