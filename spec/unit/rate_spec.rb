require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Trade::Rate do

  context "intialization" do

    it "parses a rate" do
      xml = Nokogiri.XML("<rate><from>AUD</from><to>CAD</to><conversion>1.0079</conversion></rate>")
      rate = Trade::Rate.new(xml)
      expect(rate.from).to eql("AUD")
      expect(rate.to).to eql("CAD")
      expect(rate.conversion).to eql(BigDecimal.new('1.0079'))
    end
  end
  
end