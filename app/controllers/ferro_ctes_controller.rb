class FerroCtesController < ApplicationController
  before_action :set_ferro_cte, only: [:show, :edit, :update, :destroy]

  # GET /ferro_ctes
  # GET /ferro_ctes.json
  def index
    @ferro_ctes = FerroCte.all
  end

  # GET /ferro_ctes/1
  # GET /ferro_ctes/1.json
  def show
  end

  # GET /ferro_ctes/new
  def new
    @ferro_cte = FerroCte.new
  end

  # GET /ferro_ctes/1/edit
  def edit
  end

  # POST /ferro_ctes
  # POST /ferro_ctes.json
  def create
    @ferro_cte = FerroCte.new(ferro_cte_params)

    respond_to do |format|
      if @ferro_cte.save
        format.html { redirect_to @ferro_cte, notice: 'Ferro cte was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ferro_cte }
      else
        format.html { render action: 'new' }
        format.json { render json: @ferro_cte.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ferro_ctes/1
  # PATCH/PUT /ferro_ctes/1.json
  def update
    respond_to do |format|
      if @ferro_cte.update(ferro_cte_params)
        format.html { redirect_to @ferro_cte, notice: 'Ferro cte was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ferro_cte.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ferro_ctes/1
  # DELETE /ferro_ctes/1.json
  def destroy
    @ferro_cte.destroy
    respond_to do |format|
      format.html { redirect_to ferro_ctes_url }
      format.json { head :no_content }
    end
  end

  def import
    FerroCte.import(params[:file])
    redirect_to ferro_ctes_path, notice: 'Ferro Ctes importados com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ferro_cte
      @ferro_cte = FerroCte.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ferro_cte_params
      params.require(:ferro_cte).permit(:number, :series, :weight)
    end
end
