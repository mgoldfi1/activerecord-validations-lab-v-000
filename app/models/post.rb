

class MyValidator < ActiveModel::Validator
  def validate(record)
    unless record.title.includes?(w%("Won't Believe" "Secret" "Top" "Guess"))
      record.errors[:name] << 'Need a name starting with X please!'
    end
  end
end



class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
end
