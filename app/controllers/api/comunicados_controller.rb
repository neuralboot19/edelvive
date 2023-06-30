class Api::ComunicadosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def mayores_de_edad
    mayores = Persona.where('fecha_nacimiento <= ?', 18.years.ago.to_date)
    comunicados = Comunicado.where(creador: mayores).or(Comunicado.where(receptor: mayores))
    comunicados_con_adjuntos = comunicados.includes(:adjuntos)
    
    response = {
      comunicados: comunicados_con_adjuntos,
      numero_adjuntos: comunicados_con_adjuntos.sum { |comunicado| comunicado.adjuntos.size }
    }
    
    render json: response
  end

  def suma_factorial
    result = 0
    if params[:number] <= 1
      result = 1
    else
      result = params[:number] + factor(params[:number] - 1)
    end
    render status: :ok, json: {response: result}
  end

  def factor(numero)
    if numero <= 1
      return 1
    else
      return numero + factor(numero - 1)
    end
  end
end
