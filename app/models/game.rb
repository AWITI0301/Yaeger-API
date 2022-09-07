class Game < ActiveRecord::Base
    has_many :comments, dependent: :destroy
    has_many :users, through: :comments
    validates :name, :image_url, presence: true

end