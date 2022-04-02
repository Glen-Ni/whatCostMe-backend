class Api::V1::ItemsController < ApplicationController
  def index
    items = Item.page(params[:page]).per(params[:page_size])
    render json: {resource:items,pager: {
      page: params[:page],
      page_size: items.size,
      total: Item.count
    }}
  end
  def create
    item = Item.new amount: params[:amount]
    if item.save
      render json: {resource:item}
    else
      render json: item.errors
    end
  end
end
