class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.timestamps
    end

    create_table :questions do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end

    create_table :answers do |t|
      t.string :content
      t.integer :question_id
      t.boolean :best, default: false

      t.timestamps
    end

    create_table :votes do |t|
      t.integer :user_id
      t.integer :answer_id

      t.timestamps
    end
  end
end
