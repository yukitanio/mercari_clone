class PurchasesController < ApplicationController
    before_action :authenticate_user!

    def update
        @product = Product.find(params[:id])
        if @product.purchase? && @product.inprocess!
            flash[:notice] = "ありがとうございました。商品発送までしばらくお待ちください"
            redirect_to @product
        elsif @product.inprocess? && @product.sold! 
            redirect_to @product
        else
            flash[:notice] = "エラーが発生しました。再度実行してください。"
            render 'show'
        end
    end
end

