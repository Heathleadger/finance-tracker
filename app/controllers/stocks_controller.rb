class StocksController < ApplicationController

    def search
        if params[:stock].blank?
            flash.now[:danger] = "You need to enter a symbol"
        else
            @stock = Stock.new_from_lookup(params[:stock])
            flash.now[:danger] = "You need to enter a valid symbol" unless @stock
        end
        render partial: 'users/result'
    end
    
    def list
        
    end
end
