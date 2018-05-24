class RequestsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def auth_request
    message = {message:'recieved request'}
    if(@user = User.find_by_email(params["email"]))
      if @user.valid_password?(params["password"])
        @user.renew_token
        message = {message:'successfully authenticated', user: @user.to_json }
      else
        message = {message:'incorrect email or password'}
      end
    else
      message = {message: 'no user found please sign up'}
    end
    respond_to do |format|
      # format.html
      format.json {render :json => message}
    end
  end

  def game_request
    message = {message:'recieved request'}
    if(@user = User.find_by_token(params["token"]))
      message = {message:'ok what do you want to do'}
    end
    respond_to do |format|
      # format.html
      format.json {render :json => message}
    end
  end
end
