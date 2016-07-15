require('spec_helper')

describe(Stylist) do
  describe("#name") do
    it("returns the stylist's name") do
      stylist = Stylist.new({:name => "Susan Sontag", :phone => "360-134-7483", :specialty => "color", :id => nil})
      expect(stylist.name()).to(eq("Susan Sontag"))
    end
  end

  describe("#phone") do
    it("returns the stylist's phone number") do
      stylist = Stylist.new({:name => "Susan Sontag", :phone => "360-134-7483", :specialty => "color", :id => nil})
      expect(stylist.phone()).to(eq("360-134-7483"))
    end
  end

  describe("#specialty") do
    it("returns the stylist's specialty") do
      stylist = Stylist.new({:name => "Susan Sontag", :phone => "360-134-7483", :specialty => "color", :id => nil})
      expect(stylist.specialty()).to(eq("color"))
    end
  end

  describe(".all") do
    it("initializes with an empty array") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe("#==") do
    it("confirms that it is the same stylist if the stylist has the same name and id") do
      stylist1 = Stylist.new({:name => "Susan Sontag", :phone => "360-134-7483", :specialty => "color", :id => nil})
      stylist2 = Stylist.new({:name => "Susan Sontag", :phone => "360-134-7483", :specialty => "color", :id => nil})
      expect(stylist1).to(eq(stylist2))
    end
  end

  describe("#save") do
    it("saves a new stylist to the database") do
      stylist = Stylist.new({:name => "Susan Sontag", :phone => "360-134-7483", :specialty => "color", :id => nil})
      stylist.save()
      expect(Stylist.all()).to(eq([stylist]))
    end
  end
end
