# == Schema Information
#
# Table name: users
#
#  id              :integer(8)      not null, primary key
#  username        :string          not null
#  password_digest :string          not null
#  session_token   :string          not null
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

class User < ApplicationRecord
    validates :username, presence: true
    validates :password_digest, presence: true
    validates :session_token, presence: true
    validates :password, length: { minimum: 6, allow_nil: true }

    attr_reader :password

    before_validation(on: :create) do
        self.ensure_session_token
    end

    def self.find_by_credentials(username, pw)
        errors = ActiveModel::Errors.new(User.new)
        potential_user = User.find_by(username: username)
        if potential_user == nil
            raise "Could not find user with that username or password"
        end
        pw_object = BCrypt::Password.new(potential_user.password_digest)
        
        if pw_object.is_password?(pw)
            return potential_user
        else
            raise "Could not find user with that username or password"
        end
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end

    def ensure_session_token
        if self.session_token == nil
            self.session_token = User.generate_session_token
        end
    end

    def reset_session_token
        self.session_token = User.generate_session_token
        self.save
    end

    def password=(pw)
        @password = pw
        self.password_digest = BCrypt::Password.create(pw).to_s
    end
end
