class Comunicado < ApplicationRecord
  belongs_to :creador, class_name: 'Persona'
  belongs_to :receptor, class_name: 'Persona'
  has_many :adjuntos

end
