class CertificatesController < ApplicationController
  def index
  end

  def create
    scheduled_agenda_scores = ScheduledAgendaScore.where("to_char(created_at, 'YYYY-MM-DD') between :initial_date and :final_date and owner_id = :owner_id ",
                                  { initial_date: params[:start_date] ,
                                    final_date: params[:end_date],
                                    owner_id: params[:user_id]
                                  }
                                )

    if scheduled_agenda_scores.length > 0
      certificate = Certificate.create(user_id: params[:user_id])

      scheduled_agenda_scores.each do |scheduled_agenda_score|

        CertificateProduct.create(
          certificate_id: certificate.id,
          product_id: scheduled_agenda_score.product_id
        )
      end

      redirect_to certificate_url(id: certificate.id), alert: "Todo bien todo bien!"
    else
      redirect_to certificates_url, alert: "No tienes liquidacion para certificar!"
    end

  end

  def show
    @certificate_products = CertificateProduct.where(certificate_id: params[:id])

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name", template: "certificates/show.html.erb"   # Excluding ".pdf" extension.
      end
    end
  end
end
