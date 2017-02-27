class LocalsController < ApplicationController

  # GET /locals/1
  def show
      @local = Local.find(params[:id])
  end

  # POST /locals
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

    def local_params
      params.fetch(:local, {})
    end
end
