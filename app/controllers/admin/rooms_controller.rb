class Admin::RoomsController < Admin::ApplicationController
  before_action :set_room, only: :show

  def index
    @entries = Entry.all
  end

  def show
    @message = Message.new
    @messages = Message.where(room_id: @room.id)

    # 来店日を3日以上過ぎている予約判定の為、変数定義
    # @close_reservation = @room.reservation if @room.reservation.day < Date.today - 2
  end

  private
  
  def set_room
    #予約に紐づくルームを@roomに定義
    @room = Room.find_by(entry_id: params[:id])
  end

    # roomが存在するか判定し、存在しない場合にreservation_idを渡して作成する
    # if @room.nil?
      # @room = Room.new(entry_id: params[:id])
      # redirect_to rooms_path, alert: 'メッセージルームに入れませんでした' unless @room.save
    # end
end