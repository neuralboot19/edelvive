class CreateAdjuntos < ActiveRecord::Migration[7.0]
  def change
    create_table :adjuntos do |t|
      t.integer :comunicado_id

      t.timestamps
    end
  end
end
