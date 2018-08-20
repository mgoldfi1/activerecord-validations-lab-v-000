

require 'pry'

class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}


validate :is_clickbait?
  def is_clickbait?
    binding.pry
  cb = ["Won't Believe", "Top", "Guess", "Secret"]
  cb.any? {|x| self.title.include?(x)}
  end


end
