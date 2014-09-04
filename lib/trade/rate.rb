module Trade
  class Rate

    attr_accessor :from, :to, :conversion

    def initialize(xml)
      @from, @to, @conversion = parse(xml)
    end

    def convert(transaction)
      transaction.currency = self.to
      transaction.amount = transaction.amount * self.conversion
      transaction
    end

    private

    def parse(xml)
      from = xml.search('from').first.content
      to = xml.search('to').first.content
      conversion = BigDecimal.new(xml.search('conversion').first.content)
      return from, to, conversion
    end
  end
end