class RequestsController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!
  before_action :set_variables
  # after_action :request_response
  @message = {message:'recieved request'}

  def auth_request
    if @user.valid_password?(params["password"])
      @user.renew_token
      @message = {message:'successfully authenticated', user: @user.to_json }
    else
      @message = {message:'incorrect email or password'}
    end
    request_response
  end

  def end_turn_request
    @game.end_turn
    @message = {my_turn:false}
    request_response
  end

  def game_request
    @message = @game.to_json
    request_response
  end

  def new_game_request
    @game = @user.games.create()
    @message = {game_token:@game.token}
    request_response
  end

  def invite_user
    if(user_to = User.find_by_email(params["invite_email"]))
      @game.invites.create(:user_to => user_to.id, :user_from => @user.id)
      @message = {message:'user invited successfully'}
    end
    request_response
  end

  private

    def set_variables
      if params["user_token"]
        @user = User.find_by_token(params["user_token"])
      elsif params["email"]
        @user = User.find_by_email(params["email"])
      end
      if params["game_token"]
        @game = @user.games.find_by_token(params["game_token"])
      end
    end

    def request_response
      render :json => @message
    end

end
