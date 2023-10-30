require "sequel"
$DB = Sequel.sqlite('../bookworb.db')

books = $DB[:books] 
p books
