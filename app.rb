require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/About' do
	erb :about
end

get '/Visit' do
	erb :visit
end

get '/Contacts' do
	erb :contacts
end

post '/Visit' do
	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:barber]
	@color = params[:color]

	# хеш для валидации параметров
hh = { 	:username => 'Введите имя',
  		:phone => 'Введите телефон',
  		:datetime => 'Введите дату и время' }

  	@error = hh.select {|key,_| params[key] == ""}.values.join(", ")

  	if @error != ''
    return erb :visit
  end


	erb "Отлично! #{@username}, Вы записаны на стрижку! Ваш телефон: #{@phone}, дата и время: #{@datetime}, барбер: #{@barber}, цвет краски: #{@color}"
end