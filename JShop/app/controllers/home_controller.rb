class HomeController < ApplicationController
  def index
    @random_products = Product.all.sample(20)
    @ranked_products = ((Product.all.sort_by &:sales).reverse).first(10)

    if user_signed_in?
      if current_user.role == 2
        # seller home product page
        @owned_products = Product.where(user_id: current_user.id)
        @owned_shop = Shop.where(user_id: current_user.id)

        if @owned_shop.empty?
          Shop.create(user_id: current_user.id)
        end
      elsif current_user.role == 4
        # postman deliverable product page
        @waiting_s_orders = SOrder.where(status: "Shipped")
        @delivered_orders = Delivery.where(postman_name: current_user.username)
      end
    end
  end
end
