require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/client")
require("./lib/stylist")
require("pg")

DB = PG.connect({:dbname => 'hair_salon'})

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
  @clients = Client.all()
  erb(:stylist)
end

get('/stylists/:id/edit') do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @clients = Client.all()
  erb(:update_stylist_form)
end

patch('/stylists/:id') do
  @clients = Client.all()
  stylist_id = params.fetch('id').to_i()
  @stylist = Stylist.find(stylist_id)
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

  if @clients.any?()
    client_id = params.fetch('client_id').to_i()
    if client_id.!=(0)
      client = Client.find(client_id)
      name = client.name()
      phone = client.phone()
      client.update({:name => name, :phone => phone, :stylist_id => stylist_id})
    end
  end
  erb(:stylist)
end

delete('/stylists/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i())
  @stylist.delete()
  @stylists = Stylist.all()
  @clients = @stylist.clients()
  erb(:stylists)
end

get('/clients/new') do
  erb(:client_form)
end

post('/clients') do
  name = params.fetch('name')
  phone = params.fetch('phone')
  client = Client.new({:name => name, :phone => phone, :stylist_id => nil, :id => nil})
  client.save()
  @clients = Client.all()
  erb(:clients)
end

get('/clients') do
  @clients = Client.all()
  erb(:clients)
end

get('/clients/:id') do
  @client = Client.find(params.fetch("id").to_i())
  @stylist = Stylist.find(@client.stylist_id().to_i())
  erb(:client)
end

get('/clients/:id/edit') do
  @client = Client.find(params.fetch("id").to_i())
  erb(:update_client_form)
end

patch('/clients/:id') do
  @client = Client.find(params.fetch("id").to_i())
  name = params.fetch('name')
  if name.==('')
    name = @client.name()
  end
  phone = params.fetch('phone')
  if phone.==('')
    phone = @client.phone()
  end
  @client.update({:name => name, :phone => phone})
  erb(:client)
end

delete('/clients/:id') do
  @client = Client.find(params.fetch('id').to_i())
  @client.delete()
  @clients = Client.all()
  erb(:clients)
end
