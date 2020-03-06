# frozen_string_literal: true

class CreateCategoryWatchers < ActiveRecord::Migration[5.0]
  def change
    create_table :category_watchers do |t|
      t.integer :category_id
      t.string :watchers
    end
  end
end
