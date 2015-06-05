class AddColumnsForQuizToLabels < ActiveRecord::Migration
  def change
    add_column :labels, :type, :string
    add_column :labels, :question, :string
    add_column :labels, :field1, :string
    add_column :labels, :field2, :string
    add_column :labels, :field3, :string
    add_column :labels, :field4, :string
    add_column :labels, :score_field1, :string
    add_column :labels, :score_field2, :string
    add_column :labels, :correct_field, :string
    add_column :labels, :correct_score_field, :string
    add_column :labels, :limite_datetime, :datetime
  end
end
