# Preview all emails at http://localhost:3000/rails/mailers/new_lead_email_mailer
class NewLeadEmailMailerPreview < ActionMailer::Preview

  def notify_lead_preview
    NewLeadEmailMailer.notify_lead(Lead.first)
  end

  def notify_admin_preview
    NewLeadEmailMailer.notify_admin(Lead.first)
  end


end
