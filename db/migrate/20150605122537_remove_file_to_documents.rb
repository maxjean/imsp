class RemoveFileToDocuments < ActiveRecord::Migration
  def change
    remove_column :documents, :file, :string
  end
end
