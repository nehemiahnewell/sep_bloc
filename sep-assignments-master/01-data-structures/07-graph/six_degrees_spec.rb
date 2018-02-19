include RSpec

require_relative 'six_degrees'

RSpec.describe SixDegreesOfKevinBacon, type: Class do
  let(:path) { SixDegreesOfKevinBacon.new }

  let(:kevin_bacon) { Node.new("Kevin Bacon") }
  let(:john_belush) { Node.new("John Belush") }
  let(:tim_matheson) { Node.new("Tim Matheson") }
  
  let(:johnny_weissmuller_jr) { Node.new("Johnny Weissmuller Jr") }
  let(:christopher_guest) { Node.new("Christopher Guest") }
  let(:bill_murray) { Node.new("Bill Murray") }
  
  let(:lenny_baker) { Node.new("Lenny Baker") }
  let(:shelley_winters) { Node.new("Shelley Winters") }
  let(:ellen_greene) { Node.new("Ellen Greene") }
  
  before do
    kevin_bacon.film_actor_hash["Animal House"] = [tim_matheson, john_belush]
    john_belush.film_actor_hash["Animal House"] = [kevin_bacon, tim_matheson]
    tim_matheson.film_actor_hash["Animal House"] = [kevin_bacon, john_belush]
    
    tim_matheson.film_actor_hash["Tarzan:Shame of the Jungle"] = [christopher_guest, bill_murray, johnny_weissmuller_jr]
    johnny_weissmuller_jr.film_actor_hash["Tarzan:Shame of the Jungle"] = [christopher_guest, bill_murray, tim_matheson]
    christopher_guest.film_actor_hash["Tarzan:Shame of the Jungle"] = [johnny_weissmuller_jr, bill_murray, tim_matheson]
    bill_murray.film_actor_hash["Tarzan:Shame of the Jungle"] = [johnny_weissmuller_jr, christopher_guest, tim_matheson]
    
    lenny_baker.film_actor_hash["Next Stop, Greenwich Village"] = [shelley_winters, ellen_greene, bill_murray]
    shelley_winters.film_actor_hash["Next Stop, Greenwich Village"] = [lenny_baker, ellen_greene, bill_murray]
    ellen_greene.film_actor_hash["Next Stop, Greenwich Village"] = [lenny_baker, shelley_winters, bill_murray]
    bill_murray.film_actor_hash["Next Stop, Greenwich Village"] = [shelley_winters, ellen_greene, lenny_baker]
  end


  describe "finds bacon" do
    it "finds the path to keven bacon in two steps" do
      
    end
  end
end