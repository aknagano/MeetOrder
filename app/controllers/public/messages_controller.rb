class Public::MessagesController < ApplicationController
  
  def show
  end
  
  
  def create
    message = Message.new(message_params)
    message.from = 1
    if message.save
      redirect_to public_contact_path
    else
      redirect_to public_contact_path, alert: 'メッセージを送信できませんでした'
    end
  end

  private
  def message_params
    params.require(:message).permit(:message).merge(customer_id: current_customer.id)
  end
end