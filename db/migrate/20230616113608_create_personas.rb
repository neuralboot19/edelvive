class CreatePersonas < ActiveRecord::Migration[7.0]
  def change
    create_table :personas do |t|
      t.string :nombre
      t.date :fecha_nacimiento

      t.timestamps
    end
  end
end
