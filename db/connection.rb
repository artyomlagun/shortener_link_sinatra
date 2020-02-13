require 'active_record'

ActiveRecord::Base.establish_connection({
  database: "shortener_sinatra_development",
  adapter:  "postgresql",
  host: "localhost",
  encoding: "unicode"
})