class CreateTaskposts < ActiveRecord::Migration[5.0]
  def change
    create_table :taskposts do |t|
      t.string :content
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
