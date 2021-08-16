class User < ApplicationRecord
    validates :user_name, presence: true, uniqueness: true
    validates :password_digest, presence: { message: 'Password cannot be blank'}
    validates :session_token, presence: true, uniqueness: true
    validates :password, length: { minimum: 6 }, allow_nil: true
    after_initialize :ensure_session_token
end
