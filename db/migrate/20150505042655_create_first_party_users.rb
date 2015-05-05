class CreateFirstPartyUsers < ActiveRecord::Migration
  def change
    create_table :first_party_users do |t|
      t.string :name
      t.string :provider
      t.string :uid
      t.boolean :admin, :default => false
      t.string :email
      t.timestamps
    end
  end

  def drop_users
    drop_table :first_party_users
  end

end