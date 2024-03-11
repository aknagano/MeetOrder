class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @items = Item.all.order(created_at: :desc).limit(4)
  end
end
