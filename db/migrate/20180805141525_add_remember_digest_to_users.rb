class AddRememberDigestToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :remember_digest, :string
    #rails generate migration add_remember_digest_to_users remember_digest:string
  end
end
