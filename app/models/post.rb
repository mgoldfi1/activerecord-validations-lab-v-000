

class MyValidator < ActiveModel::Validator
  def validate(record)
    unless record.title.include?("Won't Believe")
      record.errors[:title] << 'Need a  clickbait title'
    end
  end
end



class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with MyValidator
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
end
