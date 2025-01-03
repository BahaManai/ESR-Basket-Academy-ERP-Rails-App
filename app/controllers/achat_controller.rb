class AchatController < ApplicationController
  def index
    @achats = Achat.all
  end

  def show
  end
end
