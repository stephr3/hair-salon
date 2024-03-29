class Stylist

  attr_reader(:name, :phone, :specialty, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @phone = attributes.fetch(:phone)
    @specialty = attributes.fetch(:specialty)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each() do |stylist|
      name = stylist.fetch("name")
      phone = stylist.fetch("phone")
      specialty = stylist.fetch("specialty")
      id = stylist.fetch("id").to_i()
      stylists.push(Stylist.new({:name => name, :phone => phone, :specialty => specialty, :id => id}))
    end
    stylists
  end

  define_method(:==) do |another_stylist|
    self.name().==(another_stylist.name()).&(self.id().==(another_stylist.id()))
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (name, phone, specialty) VALUES ('#{@name}', '#{@phone}', '#{@specialty}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_singleton_method(:find) do |id_number|
    found_stylist = nil
    Stylist.all().each() do |stylist|
      if stylist.id().==(id_number)
        found_stylist = stylist
      end
    end
    found_stylist
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    @phone = attributes.fetch(:phone, @phone)
    @specialty = attributes.fetch(:specialty, @specialty)
    @id = self.id()
    DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id = #{@id};")
    DB.exec("UPDATE stylists SET phone = '#{@phone}' WHERE id = #{@id};")
    DB.exec("UPDATE stylists SET specialty = '#{@specialty}' WHERE id = #{@id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM stylists WHERE id = #{self.id()};")
  end

  define_method(:clients) do
    stylist_clients = []
    clients = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.id()};")
    clients.each() do |client|
      name = client.fetch("name")
      phone = client.fetch("phone")
      stylist_id = client.fetch("stylist_id").to_i()
      id = client.fetch("id").to_i()
      stylist_clients.push(Client.new({:name => name, :phone => phone, :stylist_id => stylist_id, :id => id}))
    end
    stylist_clients
  end
end
