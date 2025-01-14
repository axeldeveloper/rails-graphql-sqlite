# Rails and Graphql
# Project 
- rails
- sqlite 
- graphql

- ...

# Step 1 - install dependencies

gem install bundler

npm install --global yarn

bundle install

rails new graphql_test --database=postgresql

rake db:create

add gem 'graphql'

bundle install

rails generate graphql:install

rails generate model Author first_name:string last_name:string date_of_birth:date --no-test-framework

rails generate model Book title:string author:references publication_date:integer genre:string --no-test-framework

rake db:migrate

rake db:seed

rails db:create db:migrate db:seed

rails g graphql:object user

rails g graphql:object item

# Examples project

[link - postgres](https://selleo.com/blog/how-to-setup-a-project-with-ruby-on-rails-postresql-and-graphql)

[link - rspec](https://semaphoreci.com/community/tutorials/getting-started-with-rspec)

[link](https://evilmartians.com/chronicles/graphql-on-rails-3-on-the-way-to-perfection)

[link](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-ruby-on-rails-graphql-api)

# Example

- http://localhost:3000/graphiql

```json
{
  authors {
    id
    lastName
    firstName
    dateOfBirth
      books {
        id
         author {
          id
          lastName
        }
        genre, title , publicationDate
      }
  }
}
```

```json

mutation {
    createBook(
        title: "Pau de arara"
        authorId: 1
        publicationDate: 19470921,
        genre:Horror
      ) {
        id
    }
}
```

```json
  mutation {
        addNote(input: {
          params: { title: "GraphQL notes", body: "A long body of text about GraphQL" }})
          {
            note {
              id
              title
              body
            }
          }
}
```

```json
  query {
    fetchNote(id: 1) {
      id
      title
      body
    }
}
```

## Development

    Axel Alexander

## My web site

- [my homepage](https://axe-dev.herokuapp.com/)

## Contributing

- Axel
- anomimous

## Versioning

## Authors

- **Axel Alexander ** - _web site_ - [contact and contracts](http://axel-dev.herokuapp.com/)

  | Front | HTML | CSS    | VueJS | React | React |
  | ----- | ---- | ------ | ----- | ----- | ----- |
  | Back  | c#   | python | rails | go    | php   |

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
