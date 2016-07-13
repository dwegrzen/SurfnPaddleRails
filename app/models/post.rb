class Post < ActiveRecord::Base
  belongs_to :author

  validates :body, presence: true
end
