module Trade
  class Reducer

    def self.call(sku, currency)
      total = BigDecimal.new(0)
      File.open(TRANS_PATH).each_with_index do |row, idx|
        next if idx == 0
        next unless row.include?(sku)
        transaction = Trade::Transaction.new(row)
        if transaction.currency == 'USD'
          total += transaction.amount
        else
          total += process(transaction, currency)
        end
      end
      total
    end

    private

    def self.process(transaction, currency)
      values = rates.xpath("//rate[from='#{transaction.currency}' and to='#{currency}']")
      if values.any?
        rate = Trade::Rate.new(values.first)
        transaction = rate.convert(transaction)
        transaction.round
      else
        values = rates.xpath("//rate[from='#{transaction.currency}']")
        rate = Trade::Rate.new(values.first)
        transaction = rate.convert(transaction)
        process(transaction, currency)
      end
    end

    def self.rates
      @rates ||= Nokogiri.XML(File.open(RATES_PATH))
    end
  
  end
end