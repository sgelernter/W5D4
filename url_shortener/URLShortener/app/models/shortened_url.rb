

class ShortenedUrl < ApplicationRecord

    def self.random_code
        shortened = SecureRandom.urlsafe_base64
        until !self.exists?(['short_url = ?', shortened]) 
            shortened = SecureRandom.urlsafe_base64
        end
        self.short_url = shortened   
    end


    validates :long_url, :user_id, presence: true 
    validates :long_url, uniqueness: true 

    belongs_to :users,
    primary_key: :id, 
    foreign_key: :user_id,
    class_name: :User 
end