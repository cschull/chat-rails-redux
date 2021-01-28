class Api::V1::MessagesController < ApplicationController
  before_action :get_channels

  def index
    @messages = Message.all
    render json: @messages
  end

  def create
    @message = Mesasge.create(message_params)
    render json: @message
  end

  private

  def get_channels
    @channels = Channel.all
  end

  def message_params
    params.require(:message).permit(:user, :content, :channel)
  end
end
