class OrderItemsController < ApplicationController
    before_action :authenticate_user!, only: :index
    
    def index
        @items = current_cart.order.items
        @order = current_cart.order.sub_total
    end
    
    def create
        current_cart.add_item(
            product_id: params[:product_id],
            quantity: params[:quantity]
        )
        redirect_to root_path
    end

    def destroy
        current_cart.remove_item(id: params[:id])
        redirect_to cart_path
    end
end
