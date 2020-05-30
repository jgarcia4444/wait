class CreateHealthTips < ActiveRecord::Migration[6.0]
  def change
    create_table :health_tips do |t|
      t.string :category
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
