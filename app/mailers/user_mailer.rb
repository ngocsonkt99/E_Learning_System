# frozen_string_literal: true

class UserMailer < ApplicationMailer
  include Rails.application.routes.url_helpers
  default from: 'notifications@example.com'

  def welcome_email
    @user = params[:user]
    @url  = users_sign_in_url
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
