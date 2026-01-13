class ForgotPasswordMailer < ApplicationMailer
  def forgot_password_email
    @name = params[:name]
    @email = params[:email]
    @host = Rails.env.development? ? "http://localhost:3000" : params[:host]
    @token = params[:token]
    @url = edit_user_password_url(reset_password_token: CGI.escape(@token))
    mail(
      to: @email,
      from: "test@example.com",
      subject: "Réinitialiser votre mot de passe"
    ) do |format|
      format.html { render "forgot_password_email" }
    end
  end
end
