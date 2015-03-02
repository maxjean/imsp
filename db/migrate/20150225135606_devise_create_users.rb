class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id: :uuid do |t|
      ## Database authenticatable
      t.string :email
      t.string :encrypted_password

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.string    :firstname
      t.string    :lastname
      t.string    :name
      t.string    :channel_name
      t.string    :pseudo
      t.string    :phone
      t.string    :address
      t.string    :zip_code
      t.string    :city
      t.string    :states
      t.string    :country
      t.boolean   :isAdmin
      t.string    :profil
      t.string    :cover
      t.string    :last_device_used
      t.text      :tags
      t.string    :provider
      t.string    :uid
      t.string    :oauth_token
      t.datetime  :oauth_expires_at
      t.string    :genre

      t.timestamps
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end