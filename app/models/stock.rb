class Stock < ApplicationRecord

  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(
  publishable_token: 'pk_1a4cd9a6e2b249cebb0c1c2ee866115e',
  secret_token: 'sk_e3ef0cfbb84e41de838ce29b687f1465',
  endpoint: 'https://cloud.iexapis.com/v1')

    begin
      new(ticker: ticker_symbol, name: client.company(ticker_symbol).company_name, last_price: client.quote(ticker_symbol).latest_price )
    rescue => exception
      return nil
    end
  end
end
