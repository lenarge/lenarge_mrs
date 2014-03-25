class RodoCtesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_rodo_cte, only: [:show, :edit, :update, :destroy]

  # GET /rodo_ctes
  # GET /rodo_ctes.json
  def index
    @rodo_ctes = RodoCte.reorder(number: :desc)
  end

  # GET /rodo_ctes/1
  # GET /rodo_ctes/1.json
  def show
  end

  # GET /rodo_ctes/new
  def new
    @rodo_cte = RodoCte.new
  end

  # GET /rodo_ctes/1/edit
  def edit
  end

  # POST /rodo_ctes
  # POST /rodo_ctes.json
  def create
    @rodo_cte = RodoCte.new(rodo_cte_params)

    respond_to do |format|
      if @rodo_cte.save
        format.html { redirect_to @rodo_cte, notice: 'Rodo cte was successfully created.' }
        format.json { render action: 'show', status: :created, location: @rodo_cte }
      else
        format.html { render action: 'new' }
        format.json { render json: @rodo_cte.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rodo_ctes/1
  # PATCH/PUT /rodo_ctes/1.json
  def update
    respond_to do |format|
      if @rodo_cte.update(rodo_cte_params)
        format.html { redirect_to @rodo_cte, notice: 'Rodo cte was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @rodo_cte.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rodo_ctes/1
  # DELETE /rodo_ctes/1.json
  def destroy
    @rodo_cte.destroy
    respond_to do |format|
      format.html { redirect_to rodo_ctes_url }
      format.json { head :no_content }
    end
  end

  def import
    RodoCte.import(params[:file])
    redirect_to rodo_ctes_path, notice: 'Rodo Ctes importados com sucesso.'
  end

  def prepare_to_import
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rodo_cte
      @rodo_cte = RodoCte.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rodo_cte_params
      params.require(:rodo_cte).permit(:number, :emitted_at, :series, :amount, :weight, :cnpj)
    end
end
