class UserStocksController < ApplicationController
  
  def create
    stock = Stock.find_by_ticker(params[:stock_ticker])   
    if stock.blank?
       stock = Stock.new_from_lookup(params[:stock_ticker])
       stock.save
    end
    @user_stock = UserStock.create(user: current_user, stock: stock)
    flash[:success] = "#{@user_stock.stock.name} was add to your stocks"
    redirect_to my_portfolio_path
  end
  
  def destroy
    stock = Stock.find(params[:id])
    @user_stock = UserStock.where(user_id: current_user.id, stock_id: stock.id).first
    @user_stock.destroy
    flash[:warning] = "#{@user_stock.stock.name} was successfully deleted from your portfolio"
    redirect_to my_portfolio_path
  end
end
