class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks

  validates :name, :ticker, presence: true

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

  def self.check_db(ticker_symbol)
    where(ticker: ticker_symbol).first
  end
end
