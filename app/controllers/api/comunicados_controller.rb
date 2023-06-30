class Api::ComunicadosController < ApplicationController
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
end
