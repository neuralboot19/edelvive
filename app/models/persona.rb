class Persona < ApplicationRecord
  has_many :comunicados_enviados, foreign_key: :creador_id, class_name: 'Comunicado'
  has_many :comunicados_recibidos, foreign_key: :receptor_id, class_name: 'Comunicado'

end
