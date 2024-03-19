class Public::RoomsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_room_or_move, only: :show

  def index
    @entries = Entry.all
  end

  def show
    @message = Message.new
    @messages = Message.where(room_id: @room.id)
  end

  private

  def set_room_or_move
    # ログインユーザーの予約に紐づくルームへのアクセスでない場合、リダイレクト
    redirect_to rooms_path, alert: 'メッセージルームに入れませんでした' if Entry.find(params[:id]).customer_id != current_user.id

    #予約に紐づくルームを@roomに定義
    @room = Room.find_by(entry_id: params[:id])

    # roomが存在するか判定し、存在しない場合にreservation_idを渡して作成する
    if @room.nil?
      @room = Room.new(entry_id: params[:id])
      redirect_to rooms_path, alert: 'メッセージルームに入れませんでした' unless @room.save
    end
  end
end