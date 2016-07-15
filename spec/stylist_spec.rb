require('spec_helper')

describe(Stylist) do
  describe("#name") do
    it("returns the stylist's name") do
      stylist = Stylist.new({:name => "Susan Sontag", :phone => "360-134-7483", :specialty => "color", :id => nil})
      expect(stylist.name()).to(eq("Susan Sontag"))
    end
  end

  describe(".all") do
    it("initializes with an empty array") do
      expect(Stylist.all()).to(eq([]))
    end
  end
end
