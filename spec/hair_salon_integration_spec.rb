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

describe('view a stylist path', {:type => :feature}) do
  it "allows the salon owner to view a list of stylists" do
    stylist = Stylist.new({:name => "Susan Sontag", :phone => "360-134-7483", :specialty => "color", :id => nil})
    stylist.save()
    visit '/stylists'
    expect(page).to have_content("Susan Sontag")
  end

  it "allows the salon owner to view information about a single stylist" do
    stylist = Stylist.new({:name => "Susan Sontag", :phone => "360-134-7483", :specialty => "color", :id => nil})
    stylist.save()
    visit '/stylists'
    click_link 'Susan Sontag'
    expect(page).to have_content("Susan Sontag")
  end
end

describe('update a stylist path', {:type => :feature}) do
  it "allows the owner to update information about a stylist" do
    stylist = Stylist.new({:name => "Susan Sontag", :phone => "360-134-7483", :specialty => "color", :id => nil})
    stylist.save()
    visit '/stylists'
    click_link 'Susan Sontag'
    click_link 'Update Information'
    fill_in('phone', :with => '360-458-7633')
    click_button 'Update'
    expect(page).to have_content('360-458-7633')
  end
end

describe('delete a stylist path', {:type => :feature}) do
  it "allows the salon owner to delete a stylist" do
    stylist = Stylist.new({:name => "Susan Sontag", :phone => "360-134-7483", :specialty => "color", :id => nil})
    stylist.save()
    visit '/stylists'
    click_link 'Susan Sontag'
    click_link 'Update Information'
    click_button 'Delete Stylist Record'
    expect(page).to have_no_content("Susan Sontag")
  end
end
