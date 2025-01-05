class SalaireController < ApplicationController
  def index
    @salaires = Salaire.all
  end

  def show
  end
end
