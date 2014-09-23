class ChangeAnswers2 < ActiveRecord::Migration
  def change
    remove_column :answers, :content
    add_column :answers, :content, :text
  end
end
