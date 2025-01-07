module PaiementHelper
  def default_payment_value(joueur)
    count = joueur.parent.joueurs.count
    if count == 1
      50
    elsif count == 2
      40
    else
      30
    end
  end
end
