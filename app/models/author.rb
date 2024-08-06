class Author < ApplicationRecord
    has_many :books

    scope :received_books, -> {  where(id: Book.pluck(:author_id)) }

    # scope :for_user_public_uid, ->(user_public_uids) { joins(:users).merge(User.for_public_uid(user_public_uids)) }
end
