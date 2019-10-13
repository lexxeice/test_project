class CreatePurses < ActiveRecord::Migration[6.0]
  def change
    create_table :purses do |t|
      t.float :balance, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
