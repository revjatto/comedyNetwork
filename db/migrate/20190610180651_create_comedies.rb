class CreateComedies < ActiveRecord::Migration[5.2]
  def change
    create_table :comedies do |t|
      t.string :title
      t.text :body
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
