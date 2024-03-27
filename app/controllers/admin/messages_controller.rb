class Admin::MessagesController < Admin::ApplicationController
  
  def index 
    @customer = Customer.all
    # @messages = Message.all
  end
  
  def show 
    @customer = Customer.find(params[:customer_id])
  end
  
  def create
    message = Message.new(message_params)
    message.customer_id = params[:customer_id]
    message.from = 0
    if message.save
      redirect_to request.referer
    else
      redirect_to request.referer, alert: 'メッセージを送信できませんでした'
    end
  end

  private
  def message_params
    params.require(:message).permit(:message).merge(admin_id: current_admin.id)
  end
end