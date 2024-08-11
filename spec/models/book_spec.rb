# frozen_string_literal:

require 'rails_helper'

RSpec.describe Book, type: :model do
  subject do
    described_class.new(title: 'Anything',
                        genre: 'Horror',
                        publication_date: DateTime.now,
                        author_id: 1)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a genre' do
    subject.genre = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a publication_date' do
    subject.publication_date = nil
    expect(subject).to_not be_valid
  end

  it 'belongs to a author' do
    should belong_to(:author)
  end

  describe 'Associations' do
    it { should belong_to(:user).without_validating_presence }
  end
end
