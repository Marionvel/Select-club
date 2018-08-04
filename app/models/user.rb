class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    validates :pseudo, presence: true, uniqueness: true, length: { maximum: 25 }
    validates :first_name, presence: true
    validates :last_name, presence: true

    has_secure_password
    #Password_digest = crypte le mdp. Utilisé avec gem 'bcrypt'
end
