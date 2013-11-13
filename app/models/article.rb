class Article < ActiveRecord::Base
  has_many :comments
    
  validates_presence_of :title,:body
    
    def long_title
      "#{self.title} - #{self.published_at}"
    end
    
end
