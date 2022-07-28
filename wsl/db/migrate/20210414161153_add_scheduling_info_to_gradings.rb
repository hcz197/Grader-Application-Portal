class AddSchedulingInfoToGradings < ActiveRecord::Migration[6.1]
  def change
    add_column :gradings, :mon, :string
    add_column :gradings, :tue, :string
    add_column :gradings, :wed, :string
    add_column :gradings, :thu, :string
    add_column :gradings, :fri, :string
    add_column :gradings, :other, :string
  end
end
