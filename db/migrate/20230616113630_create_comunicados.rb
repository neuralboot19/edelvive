class CreateComunicados < ActiveRecord::Migration[7.0]
  def change
    create_table :comunicados do |t|
      t.integer :creador_id
      t.integer :receptor_id
      t.string :asunto
      t.text :contenido
      t.integer :comunicado_anterior_id

      t.timestamps
    end
  end
end
