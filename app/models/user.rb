class User < ActiveRecord::Base
    has_many :comments, dependent: :destroy
    has_many :games, through: :comments
    # password security
    has_secure_password

    validates :username, presence: true, length: {in: 6..25}
    validates :email, presence: true, uniqueness: true, format: {with: /\A(?<username>[^@\s]+)@((?<domain_name>[-a-z0-9]+)\.(?<domain>[a-z]{2,}))\z/i}
    validates :password, length: {in: 8..25}

    def self.get_user(username)
        self.where(username: username)

    end

end