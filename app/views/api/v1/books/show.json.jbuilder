json.id @book.id
json.title @book.title
json.genre @book.genre
json.publication_date @book.publication_date
json.author do
  json.name @book.author.first_name
end
