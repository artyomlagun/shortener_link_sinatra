server:
	rerun 'ruby app.rb'
db_migrate:
	ruby db/schema.rb
setup_project:
	bundle install
	make db_migrate server