class AddColumnToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :headline, :string
  end
end
