class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :author
      t.string :ticket
      t.text :content, :nil => false

      t.timestamps
    end
  end
end
