class HomeController < ApplicationController
  def index
    @random_products = Product.all.sample(10)
    @ranked_products = (Product.all.sort_by &:sales).first(10)

    if user_signed_in?
      if current_user.role == 2
        @owned_products = Product.where(user_id: current_user.id)
      end
    end
  end
end
