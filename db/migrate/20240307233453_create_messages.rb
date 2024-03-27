class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.references :customer, foreign_key: true #追加 NOT NULL制約はつけない
      t.references :admin, foreign_key: true #追加 NOT NULL制約はつけない
      t.text :message, null: false
      t.integer :from, null: false
      t.timestamps
    end
  end
end
