class Author < ApplicationRecord
  has_many :books

  has_many :audits, as: :auditable

  scope :received_books, -> { where(id: Book.pluck(:author_id)) }

  # scope :for_user_public_uid, ->(user_public_uids) { joins(:users).merge(User.for_public_uid(user_public_uids)) }

  after_update :notify_update

  private def notify_update
    ActiveSupport::Notifications.instrument('author.update', book: self)
  end
end
