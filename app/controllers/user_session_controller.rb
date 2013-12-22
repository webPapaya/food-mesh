class UserSessionController < ApplicationController
  #helper_method :change_user_settings
  def change_user_settings
    user_session.change_user_settings params

    respond_to do |format|
      format.html { redirect_to :back}
      format.js
    end
  end
end
