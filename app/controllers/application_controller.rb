class ApplicationController < ActionController::Base
    include Pagy::Backend
    $categories = Category.all

    before_action :current_cart
    helper_method :current_cart
    before_action :configure_permitted_parameters, if: :devise_controller?

    def current_cart
        current_cart ||= ShoppingCart.new(token: cart_token)
    end
    
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :avatar) }
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :avatar) }
    end

    private
    
    def cart_token
        return @cart_token unless @cart_token.nil?

        session[:cart_token] ||= SecureRandom.hex(8)
        @cart_token = session[:cart_token]
    end
    
end
