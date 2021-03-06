class AddTokenResetToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :password_recovery_token, :string
    add_column :users, :password_recovery_expiration, :timestamp
  end
end
