class Stylist

  attr_reader(:name, :phone, :specialty, :id)
  
  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @phone = attributes.fetch(:phone)
    @specialty = attributes.fetch(:specialty)
    @id = attributes.fetch(:id)
  end
end
