class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # log user in and redirect to the user's show page
      reset_session
      log_in user
      redirect_to user
    else
      # create an error message
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
  end
end
