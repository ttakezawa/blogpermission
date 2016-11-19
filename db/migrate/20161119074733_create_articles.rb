class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.references :user,  foreign_key: true, index:true, null: false
      t.string     :title, null: false
      t.text       :body,  null: false

      t.timestamps
    end
  end
end
