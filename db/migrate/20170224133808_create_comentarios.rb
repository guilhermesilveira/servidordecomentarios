class CreateComentarios < ActiveRecord::Migration[5.0]
  def change
    create_table :comentarios, id: :uuid do |t|
      t.string :autor
      t.string :texto
      t.string :local_id

      t.timestamps
    end
  end
end
