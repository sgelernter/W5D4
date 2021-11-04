

class ShortenedUrl < ApplicationRecord
    validates :long_url, :user_id, presence: true 
    validates :long_url, uniqueness: true 

    belongs_to :users,
    primary_key: :id, 
    foreign_key: :user_id,
    class_name: :User 
end