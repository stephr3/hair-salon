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
      stylist1 = Stylist.new({:name => "Susan Sontag", :phone => "360-134-7483", :specialty => "color", :id => 1})
      stylist2 = Stylist.new({:name => "Susan Sontag", :phone => "360-134-7483", :specialty => "color", :id => 1})
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

  describe("#id") do
    it("returns a stylist's id") do
      stylist = Stylist.new({:name => "Susan Sontag", :phone => "360-134-7483", :specialty => "color", :id => nil})
      stylist.save()
      expect(stylist.id().class()).to(eq(Fixnum))
    end
  end

  describe(".find") do
    it("returns a stylist by their id") do
      stylist1 = Stylist.new({:name => "Susan Sontag", :phone => "360-134-7483", :specialty => "color", :id => nil})
      stylist1.save()
      stylist2 = Stylist.new({:name => "Adam Lambert", :phone => "971-235-8217", :specialty => "fades", :id => nil})
      stylist2.save()
      expect(Stylist.find(stylist2.id())).to(eq(stylist2))
    end
  end

  describe("#update") do
    it "lets the salon owner update the attributes of a stylist" do
      stylist = Stylist.new({:name => "Susan Sontag", :phone => "360-134-7483", :specialty => "color", :id => nil})
      stylist.save()
      stylist.update({:phone => "971-356-9137"})
      expect(stylist.name()).to(eq("Susan Sontag"))
      expect(stylist.phone()).to(eq("971-356-9137"))
    end

    describe("#clients") do
    it("returns an array of clients for a stylist") do
      stylist = Stylist.new({:name => "Susan Sontag", :phone => "360-134-7483", :specialty => "color", :id => nil})
      stylist.save()
      client1 = Client.new({:name => "Billy Madison", :phone => "206-345-1273", :stylist_id => stylist.id(), :id => nil})
      client1.save()
      client2 = Client.new({:name => "Sissy Spacek", :phone => "815-398-2198", :stylist_id => stylist.id(), :id => nil})
      client2.save()
      expect(stylist.clients()).to(eq([client1, client2]))
    end
  end
  end

  describe("#delete") do
    it "lets the salon owner delete a stylist from the database" do
      stylist1 = Stylist.new({:name => "Susan Sontag", :phone => "360-134-7483", :specialty => "color", :id => nil})
      stylist1.save()
      stylist2 = Stylist.new({:name => "Adam Lambert", :phone => "971-235-8217", :specialty => "fades", :id => nil})
      stylist2.save()
      stylist1.delete()
      expect(Stylist.all()).to(eq([stylist2]))
    end
  end
end
