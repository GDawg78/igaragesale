class PaymentsController < ApplicationController
    def success                
        @item = Item.find(params["itemId"].to_i)

        transaction = @item.transactions.build buyer_id: params['buyerId'], seller_id: current_user.id
        @item.sold = true
        @item.save

        if transaction.save
            render 'success'
        else
            render 'failure'
        end
    end
end
