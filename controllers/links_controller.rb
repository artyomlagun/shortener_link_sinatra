require 'sinatra'
require 'json'
require_relative '../db/application_models'

before do
  content_type :json
end

get '/links' do
  links = Link.order(created_at: :desc).limit(10)
  links.to_json
end

get '/links/:short_link' do
  link = Link.find_by(short_link: params[:short_link])
  response = if link.present?
    link.increase_visit_count!
    {link: link, status: 200}
  else
    {status: 404}
  end
  response.to_json
end

post '/links' do
  link = Link.new(link_params)
  link.short!
  link.sanitize!
  response = if link.save
    {link: link, status: 201}
  else
    {errors: link.errors, status: 500}
  end
  response.to_json
end

private

def link_params
  {long_link: params[:long_link]}
end