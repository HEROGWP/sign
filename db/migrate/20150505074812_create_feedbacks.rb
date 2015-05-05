class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.text :q1
      t.text :q2
      t.text :q3
      t.text :q4
      t.text :q5

      t.timestamps
    end
  end
end
