require('spec_helper')

describe(Client) do
  describe("#name") do
    it("returns the client's name") do
      client = Client.new({:name => "Billy Madison", :phone => "206-345-1273", :stylist_id => nil, :id => nil})
      expect(client.name()).to(eq("Billy Madison"))
    end
  end

  describe("#phone") do
    it("returns the client's phone number") do
      client = Client.new({:name => "Billy Madison", :phone => "206-345-1273", :stylist_id => nil, :id => nil})
      expect(client.phone()).to(eq("206-345-1273"))
    end
  end

  describe("#stylist_id") do
    it("returns the client's stylist_id") do
      client = Client.new({:name => "Billy Madison", :phone => "206-345-1273", :stylist_id => 3, :id => nil})
      expect(client.stylist_id()).to(eq(3))
    end
  end

  describe(".all") do
    it("initializes with an empty array") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#==") do
    it("confirms that it is the same client if the client has the same name and id") do
      client1 = Client.new({:name => "Billy Madison", :phone => "206-345-1273", :stylist_id => nil, :id => 1})
      client2 = Client.new({:name => "Billy Madison", :phone => "206-345-1273", :stylist_id => nil, :id => 1})
      expect(client1).to(eq(client2))
    end
  end

  describe("#save") do
    it("saves a new client to the database") do
      client = Client.new({:name => "Billy Madison", :phone => "206-345-1273", :stylist_id => nil, :id => nil})
      client.save()
      expect(Client.all()).to(eq([client]))
    end
  end

  describe("#id") do
    it("returns a client's id") do
      client = Client.new({:name => "Billy Madison", :phone => "206-345-1273", :stylist_id => nil, :id => nil})
      client.save()
      expect(client.id().class()).to(eq(Fixnum))
    end
  end

  describe("#update") do
    it "lets the salon owner update the attributes of a client" do
      client = Client.new({:name => "Billy Madison", :phone => "206-345-1273", :stylist_id => nil, :id => nil})
      client.save()
      client.update({:phone => "502-275-8730"})
      expect(client.name()).to(eq("Billy Madison"))
      expect(client.phone()).to(eq("502-275-8730"))
    end
  end

  describe("#delete") do
    it "lets the salon owner delete a client from the database" do
      client1 = Client.new({:name => "Billy Madison", :phone => "206-345-1273", :stylist_id => nil, :id => nil})
      client1.save()
      client2 = Client.new({:name => "Sissy Spacek", :phone => "815-398-2198", :stylist_id => nil, :id => nil})
      client2.save()
      client1.delete()
      expect(Client.all()).to(eq([client2]))
    end
  end
end
