class Stock < ActiveRecord::Base
  default_scope order('price ASC')
  scope :filter, lambda { |low, high| where(:price => low..high) }
  
  def self.low_high_prices
    [Stock.minimum(:price), Stock.maximum(:price)]
  end
end
