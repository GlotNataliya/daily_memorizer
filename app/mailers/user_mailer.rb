class UserMailer < ApplicationMailer
  def notify_user(user)
    attachments.inline['for_kitchen.jpg'] = File.read('app/assets/images/for_kitchen.jpg')
    @user = user
    mail(to: @user.email, subject: 'welcome' )
  end
end
