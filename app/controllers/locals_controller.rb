class LocalsController < ApplicationController
  before_action :set_local, only: [:show, :edit, :update, :destroy]

  # GET /locals/1
  # GET /locals/1.json
  def show
  end

  # POST /locals
  # POST /locals.json
  def create
    Local.where("created_at < :ultimo_mes", {ultimo_mes: 1.month.ago}).each do |local|
      local.comentarios.destroy_all
      local.destroy
    end
    @local = Local.new(local_params)

    if @local.save
    else
      render json: @comentario.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_local
      @local = Local.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def local_params
      params.fetch(:local, {})
    end
end
