class CreateBasicPages < ActiveRecord::Migration
  def change

    create_table :basic_pages do |t|
      t.text :title
      t.text :body

      t.timestamps
    end
  end
end
