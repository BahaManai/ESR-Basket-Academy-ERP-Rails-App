class UserMailer < Devise::Mailer
  def reset_password_instructions(record, token, opts = {})
    ForgotPasswordMailer.with(
      name: record.user_name,
      email: record.email,
      host: Rails.application.routes.default_url_options[:host],
      token: token
    ).forgot_password_email.deliver_now
  end
end
