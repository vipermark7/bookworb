require 'sequel'

$DB = Sequel.sqlite('bookworb.db')

$DB.create_table :books do
  primary_key :id
  String :title
  String :author
  String :genre
  Integer :published_year
end

$DB.create_table :reviews do
  primary_key :id
  String :content
  Integer :rating
  foreign_key :book_id, :books
end

class Book < Sequel::Model
  one_to_many :reviews
end

class Review < Sequel::Model
  many_to_one :book
end

books = $DB[:books]

# populate the table
books.insert(
  title: "why's poignant guide",
  author: 'why the lucky stiff',
  genre: 'programming and technology',
  published_year: 2005
)


puts "all books #{DB[:books].map(:title , :author , :genre , "published_year" )}"
