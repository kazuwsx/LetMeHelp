class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :title
      t.string :detail_information
      t.boolean :completed
      t.boolean :accepted
      t.integer :user_id
      t.integer :accept_user_id
      t.timestamps
    end
  end
end
