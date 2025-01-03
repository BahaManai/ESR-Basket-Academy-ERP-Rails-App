class PaiementController < ApplicationController
  def index
    @paiements = Paiement.all
  end

  def show
  end
end
