class Removeauthorcreateid < ActiveRecord::Migration
  def change
    add_column :posts, :author_id, :integer
    remove_column :posts, :author, :string
  end
end
