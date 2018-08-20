



class Post < ActiveRecord::Base
  validate :is_clickbait?
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}



  def is_clickbait?
  cb = ["Won't Believe", "Top", "Guess", "Secret"]
  cb.any? {|x| self.title.include?(x)}
  end


end
