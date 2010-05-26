require 'spec_helper'

describe Stock do
  it "should be valid with valid attributes" do
    stock = Stock.new(:name => 'Foo', :price => 1)
    stock.should be_valid
  end
  
  it "should return stock in price ascending order by default" do
    stock_1 = Stock.create(:name => 'Foo', :price => 300)
    stock_2 = Stock.create(:name => 'Foo', :price => 400)
    stock_3 = Stock.create(:name => 'Foo', :price => 200)
    stock_4 = Stock.create(:name => 'Foo', :price => 100)
    
    Stock.all.should == [stock_4, stock_3, stock_1, stock_2]
  end
  
  it "should return the highest and lowest stock prices" do
    stock_1 = Stock.create(:name => 'Foo', :price => 100)
    stock_2 = Stock.create(:name => 'Foo', :price => 200)
    stock_3 = Stock.create(:name => 'Foo', :price => 300)
    stock_4 = Stock.create(:name => 'Foo', :price => 400)
    Stock.low_high_prices.should == [100, 400]
  end
  
  it "should filter out stocks that aren't in our range" do
    stock_1 = Stock.create(:name => 'Foo', :price => 100)
    stock_2 = Stock.create(:name => 'Foo', :price => 200)
    stock_3 = Stock.create(:name => 'Foo', :price => 300)
    stock_4 = Stock.create(:name => 'Foo', :price => 400)
    Stock.filter(200,300).should == [stock_2, stock_3]
  end
end
