module PaiementHelper
  def default_payment_value(joueur, saison)
    count = joueur.parent.joueurs.count
    montant = saison.nil? ? 50 : saison.montant_abonnement
    if count == 1
      montant
    elsif count == 2
      montant - 10
    else
      montant - 20
    end
  end
end
