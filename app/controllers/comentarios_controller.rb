class ComentariosController < ApplicationController
  before_action :set_comentario, only: [:show, :edit, :update, :destroy]

  # POST /comentarios
  # POST /comentarios.json
  def create
    p = comentario_params
    l = Local.where("id = :id", { id: p[:local_id]}).first
    @comentario = Comentario.new({autor: p[:autor], texto: p[:texto], local: l})

    puts "local"
    puts p.inspect
    puts @comentario.local
    puts @comentario.inspect
    puts "fim"

    if @comentario.save
      redirect_to @comentario.local, notice: 'Comentário gravado com sucesso.'
    else
      render json: @comentario.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comentario
      @comentario = Comentario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comentario_params
      params.permit(:autor, :texto, :local_id)
    end
end
