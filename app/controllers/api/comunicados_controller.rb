class Api::ComunicadosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def mayores_de_edad
    mayores = Persona.where('fecha_nacimiento <= ?', 18.years.ago.to_date)
    comunicados = Comunicado.where(creador: mayores).or(Comunicado.where(receptor: mayores))
    comunicados_con_adjuntos = comunicados.includes(:adjuntos)
    
    numero_adjuntos = comunicados_con_adjuntos.sum { |comunicado| comunicado.adjuntos.size }
    
    render json: {
      comunicados: comunicados_con_adjuntos,
      numero_adjuntos: numero_adjuntos
    }
  end

  def suma_factorial
    result = factor(params[:number])
    render status: :ok, json: { response: result }
  end

  def factor(numero)
    return 1 if numero <= 1
  
    numero + factor(numero - 1)
  end
end
