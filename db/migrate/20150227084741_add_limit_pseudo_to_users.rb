class AddLimitPseudoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :limit_pseudo_change, :integer
  end
end
