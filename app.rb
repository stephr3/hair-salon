require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/client")
require("./lib/stylist")
require("pg")
require("pry")

DB = PG.connect({:dbname => 'hair_salon_test'})

get('/') do
  erb(:index)
end

get('/stylists/new') do
  erb(:stylist_form)
end

post('/stylists') do
  name = params.fetch('name')
  phone = params.fetch('phone')
  specialty = params.fetch('specialty')
  stylist = Stylist.new({:name => name, :phone => phone, :specialty => specialty, :id => nil})
  stylist.save()
  @stylists = Stylist.all()
  erb(:stylists)
end

get('/stylists') do
  @stylists = Stylist.all()
  erb(:stylists)
end

get('/stylists/:id') do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist)
end

get('/stylists/:id/edit') do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:update_stylist_form)
end

patch('/stylists/:id') do
  @stylist = Stylist.find(params.fetch("id").to_i())
  name = params.fetch('name')
  if name.==('')
    name = @stylist.name()
  end
  phone = params.fetch('phone')
  if phone.==('')
    phone = @stylist.phone()
  end
  specialty = params.fetch('specialty')
  if specialty.==('')
    specialty = @stylist.specialty()
  end
  @stylist.update({:name => name, :phone => phone, :specialty => specialty})
  erb(:stylist)
end

delete('/stylists/:id') do
  @stylist = Stylist.find_by_id(params.fetch('id').to_i())
  @stylist.delete()
  @stylists = Stylist.all()
  erb(:stylists)
end
