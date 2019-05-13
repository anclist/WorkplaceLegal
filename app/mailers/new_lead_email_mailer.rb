class NewLeadEmailMailer < ApplicationMailer
  default from: 'anclist@gmail.com'

  def notify_lead(lead)
    @lead = lead
    mail(to: @lead.email, subject: "Thank you for getting in touch")
  end

  def notify_admin(lead)
    @lead = lead
    mail(to: "antonio@inventorlegal.ca", subject: "You have a new lead on workplacelegal.ca")
  end
end
