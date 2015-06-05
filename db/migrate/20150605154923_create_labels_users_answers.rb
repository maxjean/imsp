class CreateLabelsUsersAnswers < ActiveRecord::Migration
  def change
    create_table :labels_users_answers do |t|
      t.uuid :user_id
      t.references :label, index: true
      t.string :answer
    end
    add_foreign_key :labels_users_answers, :labels
  end
end
