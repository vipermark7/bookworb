require 'sequel'

$DB = Sequel.sqlite('bookworb.db')

$books = $DB[:books].all

# cat config.ru
require "roda"

class App < Roda
  plugin :json
  route do |r|
    r.root do 
      r.redirect "books"
    end
    r.on "books" do 
      r.is do
        # GET /books
        r.get do
          $books
        end
      end
    end
  end
end

run App.freeze.app
