require "csv"
class AchatController < ApplicationController
  before_action :set_achat, only: %i[edit destroy update]

  def index
    @achats = Achat.all
  end

  def index
    @achats = case params[:filter]
    when "credit"
      Achat.where(etat_paiement: "Crédit")
    when "noncredit"
      Achat.where(etat_paiement: "Non crédit")
    else
      Achat.all
    end
  end

  def edit
  end

  def show
  end

  def create
    @achat = Achat.new(achat_params)

    respond_to do |format|
      if @achat.save
        format.html { redirect_to "/joueurs/#{@achat.joueur_id}/edit", notice: "L'achat a été créé avec succès." }
        format.json { render json: @achat, status: :created }
      else
        format.html do
          error_messages = @achat.errors.full_messages.map { |msg| "<li style='list-style-type: none;'><i class='bi bi-exclamation-triangle-fill'></i>&nbsp;#{msg}</li>" }.join
          alert_message = "<h2>Erreur en ajout d'achat :</h2><ul>#{error_messages}</ul>"

          redirect_to "/joueurs/#{@achat.joueur_id}/edit", alert: alert_message.html_safe
        end
        format.json { render json: @achat.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @achat.update(achat_params)
        format.html { redirect_to "/joueurs/#{@achat.joueur_id}/edit", notice: "L'achat a été mis à jour avec succès." }
        format.json { render :edit, status: :ok, location: @achat }
      else
        format.html do
          error_messages = @achat.errors.full_messages.map { |msg| "<li style='list-style-type: none;'><i class='bi bi-exclamation-triangle-fill'></i>&nbsp;#{msg}</li>" }.join
          alert_message = "<h2>Erreur lors de la mise à jour de achat :</h2><ul>#{error_messages}</ul>"

          redirect_to "/joueurs/#{@achat.joueur_id}/edit", alert: alert_message.html_safe
        end
        format.json { render json: @achat.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @achat.destroy!
    respond_to do |format|
      format.html { redirect_to "/joueurs/#{@achat.joueur_id}/edit", status: :see_other, notice: "L'achat a été supprimé avec succès." }
      format.json { head :no_content }
    end
  end

  def export_csv
    @records = case params[:filter]
    when "credit"
      Achat.where(etat_paiement: "Crédit")
    when "noncredit"
      Achat.where(etat_paiement: "Non crédit")
    else
      Achat.all
    end

    csv_data = CSV.generate(headers: true) do |csv|
      csv << [ "Nom du joueur", "Designation", "Prix", "Date d'achat", "Num de recu", "Etat de paiement" ]
      @records.reverse.each do |record|
        etat_abonnement = case record.etat_paiement
        when "Crédit"
              "credit"
        end
        csv << [ "#{record.joueur.prénom} #{record.joueur.nom}",
                record.designation,
                "#{record.prix} DT",
                record.date_achat,
                record.num_recu,
                etat_abonnement ]
      end
    end
    respond_to do |format|
      format.csv { send_data csv_data, filename: "ESR_Academy_#{params[:filter]}Achats-#{Date.today}.csv" }
    end
  end

  private

  def set_achat
    @achat = Achat.find(params[:id])
  end

  def achat_params
    params.require(:achat).permit(:designation, :prix, :date_achat,  :etat_paiement, :joueur_id, :num_recu)
  end
end
