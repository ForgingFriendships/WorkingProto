class AddManyToManyRelationEventsAndFirstPartyUsers < ActiveRecord::Migration
  def change
    create_table :events_first_party_users, id: false do |t|
      t.integer :event_id
      t.integer :first_party_user_id
    end

    add_index :events_first_party_users, :event_id
    add_index :events_first_party_users, :first_party_user_id
  end
end
