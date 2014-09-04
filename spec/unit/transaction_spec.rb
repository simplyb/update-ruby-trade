require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Trade::Transaction do
  
  context "intialization" do

    it "parses transaction row" do
      row = "Yonkers,DM1210,70.00 USD"
      transaction = Trade::Transaction.new(row)
      expect(transaction.store).to eql("Yonkers")
      expect(transaction.sku).to eql("DM1210")
      expect(transaction.amount).to eql(BigDecimal.new('70.00'))
      expect(transaction.currency).to eql('USD')
    end

  end

end