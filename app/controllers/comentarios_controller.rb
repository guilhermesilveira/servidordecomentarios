class ComentariosController < ApplicationController

  def create
    p = comentario_params
    l = Local.where("id = :id", { id: p[:local_id]}).first
    @comentario = Comentario.new({autor: p[:autor], texto: p[:texto], local: l})

    if @comentario.save
      redirect_to @comentario.local
    else
      render json: @comentario.errors, status: :unprocessable_entity
    end
  end

  private

    def comentario_params
      params.permit(:autor, :texto, :local_id)
    end
end
