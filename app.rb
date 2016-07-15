require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/client")
require("./lib/stylist")
require("spec_helper")


get('/') do
  erb(:index)
end

get('/stylists/new') do
  erb(:stylist_form)
end
