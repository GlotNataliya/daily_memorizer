class CustomerMailer < ApplicationMailer
  def notify_customer(customer)
    attachments.inline['for_kitchen.jpg'] = File.read('app/assets/images/for_kitchen.jpg')
    @customer = customer
    mail(to: customer.email, subject: 'welcome' )
  end
end
