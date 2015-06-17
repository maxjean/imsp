class AddQuizUrlToLabel < ActiveRecord::Migration
  def change
    add_column :labels, :quiz_url, :string
  end
end
