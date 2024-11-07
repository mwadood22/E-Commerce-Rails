class CheckoutController < ApplicationController
    
  def new
  end

  def create
    @items = current_cart.order.items
    @products = Array.new
    quantity = 0
      
    @items.each do |item|
      quantity += item.quantity
    end

    dis_value = session['discount'].to_i / quantity

    @items.each do |items|
      @products += [
      'name': items.product.title,
      'amount': ("#{items.price}".to_i * 100) - (dis_value.to_i * 100),
      'currency': "usd",
      'adjustable_quantity': {
        'enabled': true,
        'minimum': 1,
        'maximum': 10,
      },
      'quantity': items.quantity,
      ];
      end
      @session = Stripe::Checkout::Session.create({
          customer: current_user.stripe_customer_id,
          payment_method_types: ['card'],
          line_items: [
              @products
          ],
          mode: 'payment',
          success_url: "http://localhost:3000",
          cancel_url: "http://localhost:3000/cart",
          })

          session[:cart_token] = nil
          session['discount'] = nil

          rescue Stripe::CardError => e
            flash[:error] = e.message
            redirect_to new_checkout_path
        
          respond_to do |format|
            format.js
          end
  end

end
