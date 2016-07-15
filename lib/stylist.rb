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
end
