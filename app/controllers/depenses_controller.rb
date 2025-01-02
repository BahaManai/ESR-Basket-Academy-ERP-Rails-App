class DepensesController < ApplicationController
  before_action :set_depense, only: %i[ show edit update destroy ]

  # GET /depenses or /depenses.json
  def index
    @depenses = Depense.all
  end

  # GET /depenses/1 or /depenses/1.json
  def show
  end

  # GET /depenses/new
  def new
    @depense = Depense.new
  end

  # GET /depenses/1/edit
  def edit
  end

  # POST /depenses or /depenses.json
  def create
    @depense = Depense.new(depense_params)

    respond_to do |format|
      if @depense.save
        format.html { redirect_to @depense, notice: "Depense was successfully created." }
        format.json { render :show, status: :created, location: @depense }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @depense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /depenses/1 or /depenses/1.json
  def update
    respond_to do |format|
      if @depense.update(depense_params)
        format.html { redirect_to @depense, notice: "Depense was successfully updated." }
        format.json { render :show, status: :ok, location: @depense }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @depense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /depenses/1 or /depenses/1.json
  def destroy
    @depense.destroy!

    respond_to do |format|
      format.html { redirect_to depenses_path, status: :see_other, notice: "Depense was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_depense
      @depense = Depense.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def depense_params
      params.expect(depense: [ :designation, :prix, :date_depense ])
    end
end
