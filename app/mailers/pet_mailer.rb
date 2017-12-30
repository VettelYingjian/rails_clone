class PetMailer < ApplicationMailer
  default from: "zsy2053@gmail.com"

  def pet_email(user)
    @user = user
    mail(to: @user.email, subject: "New message from " + @user.email)
  end
end
