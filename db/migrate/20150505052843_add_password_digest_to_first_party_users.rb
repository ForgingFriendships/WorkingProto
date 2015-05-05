class AddPasswordDigestToFirstPartyUsers < ActiveRecord::Migration
  def change
    add_column :first_party_users, :password_digest, :string
  end
end
