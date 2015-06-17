class AddQuizStepToLabelsUsersAnswers < ActiveRecord::Migration
  def change
    add_column :labels_users_answers, :quiz_step, :string
  end
end
