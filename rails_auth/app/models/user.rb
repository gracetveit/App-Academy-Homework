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
    validates :password_digest, length: { minimum: 6, allow_nil: true }

    before_validation(on: create) do
        self.ensure_session_token
    end

    def ensure_session_token
    end
end
