class TicketsMailer < ApplicationMailer
  def booking_confirmation(ticket)
    @ticket = ticket
    @user = ticket.user

    mail(to: @user.email,
         subject: t('tickets_mailer.booking_confirmation.thanks_for_booking'))
  end
end
