module Types
  class MutationType < Types::BaseObject
    field :create_book, mutation: Mutations::Books::CreateBook

    field :create_author, mutation: Mutations::Authors::CreateAuthor
  end
end
