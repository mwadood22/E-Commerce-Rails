class ProductsController < ApplicationController
    before_action :force_json, only: :search
    before_action :set_product, only: [:show, :edit, :update, :destroy]
    before_action :set_category
    
    def index
        @pagy, @products = pagy(Product.all.order(id: :desc), items: 6)
    end

    def show
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
                
        if @product.save
            redirect_to @product
        else
            flash[:error] = "Product was not added!"
            render :new
        end
    end

    def edit
    end

    def update
        if @product.update(product_params)
            redirect_to @product
        else
            flash[:error] = "Product was not added!"
            render :edit
        end
    end

    def destroy
        if @product.destroy
            redirect_to root_path
        else
            flash[:error] = "Product can not be deleted!"
        end
    end

    def search
        @product = Product.where("title LIKE'%#{params[:q]}%'").limit(5)
        
    end

    

    private

    def product_params
        params.require(:product).permit(:title, :description, :price, :category_id, :user_id, images: [])
    end

    def force_json
        request.format = :json
    end

    def set_category
        @categories = Category.all
    end

    def set_product
        @product = Product.find(params[:id])
    end
    
end
