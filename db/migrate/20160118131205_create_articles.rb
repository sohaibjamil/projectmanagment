class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :idea, :summary, :description
      t.timestamps
    end
  end
end
