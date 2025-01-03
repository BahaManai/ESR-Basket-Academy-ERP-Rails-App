class CreditController < ApplicationController
  def index
    @credits = Credit.all
  end

  def show
  end
end
