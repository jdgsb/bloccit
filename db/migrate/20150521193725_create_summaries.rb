class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.text :abstract

      t.timestamps null: false
    end
  end
end
