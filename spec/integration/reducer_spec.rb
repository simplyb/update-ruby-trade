  require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
  
  describe Trade::Reducer do
    context "totaling transactions by sku for currency" do
      it "totals properly" do
        expect(Trade::Reducer.call('DM1182', 'USD')).to eql(BigDecimal.new('134.22'))
      end
    end
  end