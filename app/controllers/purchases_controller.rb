class PurchasesController < ApplicationController

    def update
        @product = Product.find(params[:id])
        if @product.purchase? && @product.inprocess!
            flash[:notice] = "ありがとうございました。商品発送までしばらくお待ちください"
            redirect_to @product
        elsif @product.inprocess? && @product.sold! 
            redirect_to @product
        else
            render 'show'
        end
    end
end

