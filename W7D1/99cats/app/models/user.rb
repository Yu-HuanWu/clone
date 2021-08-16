class User < ApplicationRecord
    validates :user_name, presence: true, uniqueness: true
    validates :password_digest, presence: { message: 'Password cannot be blank'}
    validates :session_token, presence: true, uniqueness: true
    validates :password, length: { minimum: 6 }, allow_nil: true
    after_initialize :ensure_session_token

    attr_reader :password

    def self.find_by_credentials(user_name, pass_word)
        user = User.find_by(user_name: user_name)
        if user && user.is_password?(pass_word)
            user
        else
            nil
        end
    end
    
    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token
    end

    def password=(pass_word)
        @password = pass_word
        self.password_digest = BCrypt::Password.create(pass_word)
    end

    def is_password?(pass_word)
        password_object = BCrypt::Password.new(self.password_digest)
        password_object.is_password?(pass_word)
    end

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end

end
