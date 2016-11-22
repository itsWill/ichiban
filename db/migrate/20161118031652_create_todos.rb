class CreateTodos < ActiveRecord::Migration[5.0]
  def change
    create_table :todos do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
