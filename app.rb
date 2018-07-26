require 'sinatra'
require_relative 'pokerhand.rb'

enable :sessions

get '/' do
	erb :enter
end

post '/hands' do
	session[:hands] = params[:hands]
	session[:hands] = hand_builder()
	session[:compare] = params[:compare]
	session[:compare] = hand_comparison(session[:hands])
	puts "I am session[:compare] #{session[:compare]}"
	puts "I am session[:hands] #{session[:hands]}"
	redirect '/winner'
end

get '/winner' do
	session[:hands]
	session[:compare]
	erb :hands, locals:{hands: session[:hands], compare: session[:compare]}
end