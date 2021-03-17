class CreateSweets < ActiveRecord::Migration[6.0]
  def change
    create_table :sweets do |t|
      t.string      :name,       null: false
      t.integer     :price,      null: false
      t.string      :shop_info,  null: false
      t.text        :text
      t.references  :user,       foreign_key: true
      t.timestamps
    end
  end
end
