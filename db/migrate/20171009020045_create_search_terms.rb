class CreateSearchTerms < ActiveRecord::Migration[5.0]
  def change
    create_table :search_terms do |t|
      t.string :content, null: false

      t.timestamps
    end

    add_index(:search_terms, :content, unique: true)
  end
end
