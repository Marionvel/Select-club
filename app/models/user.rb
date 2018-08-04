class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    validates :pseudo, presence: true, uniqueness: true, length: { maximum: 25 }
    validates :first_name, presence: true
    validates :last_name, presence: true

    has_secure_password
    #Password_digest = crypte le mdp. Utilisé avec gem 'bcrypt'

    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
      end
end
