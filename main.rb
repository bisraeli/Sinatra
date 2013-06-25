require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do         #get is a method - parameter '/' passed thru
  "Hello!"
end

get '/hello_world' do # '/' is a root directory
  "Hello, world!"
end

get '/hello_me' do
  @me = "David"
  return "Hello, #{@me}"
end

get '/hello_you/:name' do
  @name = params[:name]
  return "Hello, #{@name}"
  end

# localhost:4567/david/fisher

get '/names/:first/:last' do
  @first = params[:first]
  @last = params[:last]
  return "You can do multiple parameters, #{@first}, #{@last} !"
end

get '/calc/add/:first/:second' do
  @first = params[:first].to_i
  @second = params[:second].to_i
  #It wants a string Must change to integers

  return (@first + @second).to_s
end

get'/calc/multiply/:first/:second' do
  @first = params[:first].to_i
  @second = params[:second].to_i

  return (@first * @second).to_s
end

get'/calc/subtract/:first/:second' do
  @first = params[:first].to_i
  @second = params[:second].to_i

  return (@first - @second).to_s
end

get'/calc/divide/:first/:second' do
  @first = params[:first].to_i
  @second = params[:second].to_i

  return (@first/@second).to_s
end

get '/oh_hai/:name' do
  @name = params[:name]
  erb :hai
end

get '/calc/:first/:operation/:second' do
  @first = params[:first].to_f
  #valid operations: sum, difference, product, quotient
  @operation = params[:operation]
  @second = params[:second].to_f
  @result = case @operation
  when "sum" then @first + @second
  when "difference" then @first - @second
  when "product" then @first * @second
  when "quotient" then @first/ @second
  end
  return @result.to_s
end


get '/calc_form' do
  @first = params[:first].to_f
  #valid operations: sum, difference, product, quotient
  @operation = params[:operation]
  @second = params[:second].to_f
  @result = case @operation
  when "sum" then @first + @second
  when "difference" then @first - @second
  when "product" then @first * @second
  when "quotient" then @first/ @second
  end
  erb :calc_form
end


