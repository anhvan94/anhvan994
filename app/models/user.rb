class User < ApplicationRecord
    attr_accessor :remember_token, :activation_token, :reset_token
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
    def create_reset_digest
        self.reset_token = User.new_token
        update_attribute(:reset_digest, User.digest(reset_token))
        update_attribute(:reset_sent_at, Time.zone.now)
    end

    def send_password_reset_email
        UserMailer.password_reset(self).deliver_now
    end
    def password_reset_expired?
        reset_sent_at < 2.hours.ago
    end
    def User.new_token
        SecureRandom.urlsafe_base64
    end
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? 
        BCrypt::Engine::MIN_COST : BCrypt::Engine.cost 
        BCrypt::Password.create(string, cost: cost)
    end

end
