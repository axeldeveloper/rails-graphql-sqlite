puts "CREATE SEEDs"
puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

puts "CREATE AUTHOR"
stephen = Author.create(first_name: Faker::Name.name, last_name: 'King', date_of_birth: Date.parse('1947-09-21'))
lee     = Author.create(first_name: Faker::Name.name, last_name: 'Child', date_of_birth: Date.parse('1954-10-29'))


puts "CREATE BOOK"
['Thriller','Horror','Mystery','Comedy','Action','Adventure','Police','Drama','Suspension'].each { |x| 
    Book.create(
        title: Faker::Job.title , 
        author: stephen, 
        publication_date: Faker::Number.binary(digits: 4), 
        genre: x)  
}
