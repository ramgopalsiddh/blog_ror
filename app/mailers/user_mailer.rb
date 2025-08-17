class UserMailer < ApplicationMailer
  default_url_options do
    Rails.application.routes.default_url_options
  end

  def password_reset(user)
    @user = user
    mail to: @user.email, subject: "Password Reset Instructions"
  end
end
