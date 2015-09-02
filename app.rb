require 'rubygems'
require 'sinatra'
require './tweet.rb'
require 'bundler'

Bundler.require

configure :production do
  set :server, :puma
end

get '/' do
  'under construction'
end

#get '/random_tweet' do
#  Tweet.new.random_tweet  # 動作チェックが終わったらコメントアウトすること
#end
