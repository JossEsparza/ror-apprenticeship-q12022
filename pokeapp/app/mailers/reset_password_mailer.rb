class ResetPasswordMailer < ApplicationMailer
  default from: 'pokeapp@email.com'

  def reset_password_confirmation
    @user = params[:user]
    mail(to: @user.email, subject: "Reset your password")
  end
end
