# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { 'Sample Book Title' }
    author { 'Sample Author' }
    published_date { 1.year.ago.to_date }
    genre { 'Fiction' }

    trait :with_special_edition do
      genre { 'Special Edition' }
    end
  end
  # using
  # let(:special_book) { create(:book, :with_special_edition) }
end
