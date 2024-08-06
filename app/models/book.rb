class Book < ApplicationRecord

  ALL_GENRES = %w[Thriller Horror Mystery Comedy Action Adventure Police Drama Suspension].freeze

  enum genre: ALL_GENRES.zip(ALL_GENRES).to_h

  validates_presence_of :title
  # validates_presence_of :author_id
  validates_presence_of :publication_date
  validates_presence_of :genre
 
  
  belongs_to :author , optional: true

  default_scope { order(id: :desc) }

  scope :order_title, -> { order(:title) }

  scope :top, lambda { |limit| limit(limit) }

  scope :recent_books, lambda { |since_when| where("created_at >= ?", since_when) }

  def self.ordered
     order("publication_date") 
  end

  def self.premium_user_ids
    Rails.cache.fetch 'app_premium_user_ids', expires_in: 1.minutes do
      # microservice call
      
    end
  end

end
