class AddLocationInformationToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :location_information, :string, default: "東京都港区高輪２丁目３−２３"
  end
end
