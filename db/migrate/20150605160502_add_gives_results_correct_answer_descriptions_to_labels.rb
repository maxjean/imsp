class AddGivesResultsCorrectAnswerDescriptionsToLabels < ActiveRecord::Migration
  def change
    add_column :labels, :gives_results, :bool
    add_column :labels, :correct_answer_descriptions, :text
  end
end
