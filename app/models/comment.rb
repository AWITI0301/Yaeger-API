class Comment < ActiveRecord::Base
    belongs_to :user
    belongs_to :game
    validates :comment, presence: true

end