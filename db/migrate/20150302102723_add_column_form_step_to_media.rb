class AddColumnFormStepToMedia < ActiveRecord::Migration
  def change
    add_column :medias, :form_step, :string
  end
end
