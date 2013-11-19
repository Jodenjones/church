class OrderItemsController < ApplicationController
  
  def create
    @order_item = OrderItem.find_by_service_id(params[:order_item][:service])
    if !@order_item
      @order_item = OrderItem.new
    end
    
    @service = Service.find(params[:order_item][:service])
    @order_item.valor = params[:order_item][:valor]
    @order_item.service = @service
  end

  def destroy
    @service = params[:service_id].to_i
  end
end
