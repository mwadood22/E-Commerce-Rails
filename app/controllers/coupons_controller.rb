class CouponsController < ApplicationController
    def apply
        @coupon = Coupon.find_by(title: params[:title])
        session['discount'] = 0
            
        if coupon_active?
            gross = current_cart.sub_total
            session['discount'] = current_cart.sub_total * @coupon.percentage
            current_cart.sub_total - session['discount']
        end
        redirect_to order_items_path
    end

    private

    def coupon_active?
        if @coupon.status == 'active'
            true
        else
            false
        end
    end
end
