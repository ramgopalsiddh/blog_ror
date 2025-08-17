class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user.present?
      @user.generate_password_reset_token!
      UserMailer.password_reset(@user).deliver_now
      redirect_to root_path, notice: "Password reset instructions sent to your email."
    else
      flash.now[:alert] = "Email not found."
      render :new
    end
  end

  def edit
    @user = User.find_by(reset_password_token: params[:token])
    redirect_to root_path, alert: "Invalid or expired token." if @user.nil? || @user.password_reset_token_expired?
  end

  def update
    @user = User.find_by(reset_password_token: params[:token])

    if @user.nil? || @user.password_reset_token_expired?
      redirect_to new_password_reset_path, alert: "Invalid or expired token."
    elsif @user.update(password_params)
      @user.clear_password_reset_token!
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Password successfully updated."
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
