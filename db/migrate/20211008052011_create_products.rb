# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table(:product_brands) do |t|
      t.string(:name, null: false)
      t.bigint(:brand_id, null: false, index: true)

      t.timestamps
    end

    create_table(:products) do |t|
      t.integer(:marketplace, null: false)
      t.string(:name, null: false)
      t.bigint(:product_id, null: false, index: true)
      t.references(:product_brand, null: false, index: false)

      t.timestamps
    end

    create_table(:product_ranks) do |t|
      t.references(:product, null: false, index: false)
      t.text(:search_phrase, null: false)
      t.integer(:rank, null: false)
      t.datetime(:seach_date, null: false)

      t.timestamps
    end
  end
end
