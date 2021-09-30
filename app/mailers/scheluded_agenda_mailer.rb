class ScheludedAgendaMailer < ApplicationMailer
  def remember (scheduled_agenda_id)
    @scheduled_agenda = ScheduledAgenda.find(scheduled_agenda_id)
    mail(to: @scheduled_agenda.contact_email, subject: 'Recordando la cita agendada')
  end
end
