module Trade
  class Transaction

    attr_accessor :store, :sku, :amount, :currency

    def initialize(row)
      @store, @sku, @amount, @currency = parse(row)
    end

    def round
      BigDecimal.new(self.amount).round(2, :banker)
    end

    private

    def parse(row)
      values = row.split(",")
      store = values[0]
      sku = values[1]
      money = values[2].split(" ")
      amount = BigDecimal.new(money[0])
      currency = money[1]
      return store, sku, amount, currency
    end

  end
end