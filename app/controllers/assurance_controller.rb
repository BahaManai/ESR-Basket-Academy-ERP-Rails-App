require "csv"
class AssuranceController < ApplicationController
  before_action :set_assurance, only: %i[edit destroy update]

  def index
    @assurances = case params[:filter]
    when "credit"
      Assurance.where(etat_paiement: "Crédit")
    when "noncredit"
      Assurance.where(etat_paiement: "Non crédit")
    else
      Assurance.all
    end
  end

  def show
  end

  def edit
  end

  def create
    @assurance = Assurance.new(assurance_params)

    respond_to do |format|
      if @assurance.save
        format.html { redirect_to "/joueurs/#{@assurance.joueur_id}/edit", notice: "L'assurance a été créée avec succès." }
        format.json { render json: @assurance, status: :created }
      else
        format.html do
          error_messages = @assurance.errors.full_messages.map { |msg| "<li style='list-style-type: none;'><i class='bi bi-exclamation-triangle-fill'></i>&nbsp;#{msg}</li>" }.join
          alert_message = "<h2>Erreur en ajout d'assurance :</h2><ul>#{error_messages}</ul>"

          redirect_to "/joueurs/#{@assurance.joueur_id}/edit", alert: alert_message.html_safe
        end
        format.json { render json: @assurance.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @assurance.update(assurance_params)
        format.html { redirect_to "/joueurs/#{@assurance.joueur_id}/edit", notice: "L'assurance a été mise à jour avec succès." }
        format.json { render :edit, status: :ok, location: @assurance }
      else
        format.html do
          error_messages = @assurance.errors.full_messages.map { |msg| "<li style='list-style-type: none;'><i class='bi bi-exclamation-triangle-fill'></i>&nbsp;#{msg}</li>" }.join
          alert_message = "<h2>Erreur lors de la mise à jour de assurance :</h2><ul>#{error_messages}</ul>"

          redirect_to "/joueurs/#{@assurance.joueur_id}/edit", alert: alert_message.html_safe
        end
        format.json { render json: @assurance.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @assurance.destroy!
    respond_to do |format|
      format.html { redirect_to "/joueurs/#{@assurance.joueur_id}/edit", status: :see_other, notice: "L'assurance a été supprimée avec succès." }
      format.json { head :no_content }
    end
  end

  def export_csv
    @records = case params[:filter]
    when "credit"
      Assurance.where(etat_paiement: "Crédit")
    when "noncredit"
      Assurance.where(etat_paiement: "Non crédit")
    else
      Assurance.all
    end

    csv_data = CSV.generate(headers: true) do |csv|
      csv << [ "Nom du joueur", "Saison", "Montant", "Date de paiement", "Num de recu", "Etat de paiement" ]
      @records.reverse.each do |record|
        etat_abonnement = case record.etat_paiement
        when "Crédit"
              "credit"
        end
        csv << [ "#{record.joueur.prénom} #{record.joueur.nom}",
                "#{record.saison.date_debut.strftime('%d')} #{I18n.t('date.month_names_short_csv')[record.saison.date_debut.month]} #{record.saison.date_debut.strftime('%Y')} - #{record.saison.date_fin.strftime('%d')} #{I18n.t('date.month_names_short_csv')[record.saison.date_fin.month]} #{record.saison.date_fin.strftime('%Y')}",
                "#{record.montant} DT",
                record.date_paiement,
                record.num_recu,
                etat_abonnement ]
      end
    end
    respond_to do |format|
      format.csv { send_data csv_data, filename: "ESR_Academy_#{params[:filter]}Assurances-#{Date.today}.csv" }
    end
  end

  private

  def set_assurance
    @assurance = Assurance.find(params[:id])
  end

  def assurance_params
    params.require(:assurance).permit(:date_paiement,  :etat_paiement, :joueur_id, :saison_id, :montant, :num_recu)
  end
end
