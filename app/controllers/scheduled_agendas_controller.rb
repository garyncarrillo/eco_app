class ScheduledAgendasController < ApplicationController
  layout "home"

  before_action :set_scheduled_agenda, only: %i[ show edit update destroy ]

  # GET /scheduled_agendas or /scheduled_agendas.json
  def index
    @scheduled_agendas = ScheduledAgenda.all
  end

  # GET /scheduled_agendas/1 or /scheduled_agendas/1.json
  def show
  end

  # GET /scheduled_agendas/new
  def new
    @scheduled_agenda = ScheduledAgenda.new
  end

  # GET /scheduled_agendas/1/edit
  def edit
  end

  # POST /scheduled_agendas or /scheduled_agendas.json
  def create
    all_params = scheduled_agenda_params
    pp all_params
    all_params [:owner_id] = current_user.id
    @scheduled_agenda = ScheduledAgenda.new(all_params)

    respond_to do |format|
      if @scheduled_agenda.save
        format.html { redirect_to @scheduled_agenda, notice: "Fue agendado correctamente." }
        format.json { render :show, status: :created, location: @scheduled_agenda }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @scheduled_agenda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scheduled_agendas/1 or /scheduled_agendas/1.json
  def update
    respond_to do |format|
      if @scheduled_agenda.update(scheduled_agenda_params)
        format.html { redirect_to @scheduled_agenda, notice: "La cita fue reprogramada correctamente." }
        format.json { render :show, status: :ok, location: @scheduled_agenda }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @scheduled_agenda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scheduled_agendas/1 or /scheduled_agendas/1.json
  def destroy
    @scheduled_agenda.destroy
    respond_to do |format|
      format.html { redirect_to scheduled_agendas_url, notice: "La agena fue eliminada correctamente." }
      format.json { head :no_content }
    end
  end

  def add_product
    scheduled_agenda = ScheduledAgenda.find(params[:id])

    collect = Collect.new(scheduled_agenda_id: scheduled_agenda.id, product_id: params[:collect][:product_id])

    if collect.save
      render json: { collect: collect, product: collect.product }, status: 200
    else
      render json: { errors: collect.errors.messages }, status: 406
    end
  end

  def remember
    ScheludedAgendaMailer.remember(params[:id]).deliver_now
  end

  def score
    scheduled_agenda = ScheduledAgenda.find(params[:id])

    if scheduled_agenda.state == ScheduledAgenda::STATE_QUALITY
      return render json: { errors: 'This one has already been liquidated' }, status: 406
    end
    scheduled_agenda.quality
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scheduled_agenda
      @scheduled_agenda = ScheduledAgenda.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def scheduled_agenda_params
      params.require(:scheduled_agenda).permit(
        :address,
        :contact_name,
        :contact_email,
        :contact_phone_number,
        :scheduled_date
      )
    end

    def collect_params
      params.require(:collect).permit(:product_id)
    end
end
