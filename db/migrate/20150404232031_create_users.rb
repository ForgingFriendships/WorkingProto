class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :provider
      t.string :uid
      t.timestamps
    end
  end

  def drop_users
    drop_table :users
  end

end
