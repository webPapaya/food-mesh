class UserSessionController < ApplicationController
  #helper_method :change_user_settings
  def change_user_settings

    respond_to do |format|
      format.html { redirect_to :back, notice: 'User Settings updated'}
      format.js
    end
  end
end
