class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :token_digest

      t.timestamps null: false
    end
  end
end
