# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  short_url  :string           not null
#  long_url   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
require "byebug"
class ShortenedUrl < ApplicationRecord 
    validates :short_url, presence: true, uniqueness: true

    def self.random_code
        short_url = SecureRandom::urlsafe_base64
    end 

    def self.generate(user, long_url)
       
        short_url2 = ShortenedUrl.random_code
        ShortenedUrl.create!(:short_url short_url2, :long_url long_url, :user_id user.id)
    end 
end 

