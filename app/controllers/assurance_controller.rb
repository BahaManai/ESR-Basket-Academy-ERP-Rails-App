class AssuranceController < ApplicationController
  def index
    @assurances = Assurance.all
  end

  def show
  end
end
