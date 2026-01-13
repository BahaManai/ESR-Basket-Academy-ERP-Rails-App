class DashbordController < ApplicationController
  def index
    selected_year = params[:annee].to_i if params[:annee].present?
    selected_year ||= Date.today.year

    selected_month = params[:mois].to_i if params[:mois].present?
    selected_month ||= Date.today.month

    @total_salaires_for_month = Salaire.where(annee: selected_year, mois: selected_month).sum(:salaire)

    @nb_joueurs_for_month = Joueur.where(created_at: Date.new(selected_year, selected_month, 1)..Date.new(selected_year, selected_month, -1)).count

    @nb_joueurs_for_year = Joueur.where("strftime('%Y', created_at) = ?", selected_year.to_s).count

    @total_depenses_for_month = Depense.where(date_depense: Date.new(selected_year, selected_month, 1)..Date.new(selected_year, selected_month, -1)).sum(:prix)

    @total_abonnements_for_year = Paiement.where("strftime('%Y', date_abonnement) = ? AND etat_abonnement = ?", selected_year.to_s, "Non crédit").sum(:montant)

    @total_abonnements_for_month = Paiement.where(date_abonnement: Date.new(selected_year, selected_month, 1)..Date.new(selected_year, selected_month, -1),
    etat_abonnement: "Non crédit").sum(:montant)

    @total_assurances_for_year = Assurance.where("strftime('%Y', date_paiement) = ? AND etat_paiement = ?", selected_year.to_s, "Non crédit").sum(:montant)

    @total_assurances_for_month = Assurance.where(date_paiement: Date.new(selected_year, selected_month, 1)..Date.new(selected_year, selected_month, -1),
    etat_paiement: "Non crédit").sum(:montant)

    @total_achats_for_year = Achat.where("strftime('%Y', date_achat) = ? AND etat_paiement = ?", selected_year.to_s, "Non crédit").sum(:prix)

    @total_achats_for_month = Achat.where(date_achat: Date.new(selected_year, selected_month, 1)..Date.new(selected_year, selected_month, -1),
    etat_paiement: "Non crédit").sum(:prix)

    @total_for_year = @total_abonnements_for_year + @total_assurances_for_year + @total_achats_for_year

    @total_for_month = @total_abonnements_for_month + @total_assurances_for_month + @total_achats_for_month

    @total_crédits_for_year = Paiement.where("strftime('%Y', date_abonnement) = ? AND etat_abonnement = ?", selected_year.to_s, "Crédit").sum(:montant) + Assurance.where("strftime('%Y', date_paiement) = ? AND etat_paiement = ?", selected_year.to_s, "Crédit").sum(:montant) + Achat.where("strftime('%Y', date_achat) = ? AND etat_paiement = ?", selected_year.to_s, "Crédit").sum(:prix)

    @total_crédits_for_month = Paiement.where(date_abonnement: Date.new(selected_year, selected_month, 1)..Date.new(selected_year, selected_month, -1),
    etat_abonnement: "Crédit").sum(:montant) + Assurance.where(date_paiement: Date.new(selected_year, selected_month, 1)..Date.new(selected_year, selected_month, -1),
    etat_paiement: "Crédit").sum(:montant) + Achat.where(date_achat: Date.new(selected_year, selected_month, 1)..Date.new(selected_year, selected_month, -1),
    etat_paiement: "Crédit").sum(:prix)

    @surplus_déficit_month = @total_for_month - @total_salaires_for_month - @total_depenses_for_month
  end
end
