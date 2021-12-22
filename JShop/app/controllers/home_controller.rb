class HomeController < ApplicationController
  def index
    @random_products = Product.all.sample(10)
    @ranked_products = (Product.all.sort_by &:sales).first(10)
  end
end
