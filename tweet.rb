# -*- coding: utf-8 -*- 

require 'rubygems'
require 'twitter'

RACK_ENV = ENV['RACK_ENV'] ||= 'development' unless defined?(RACK_ENV)

if RACK_ENV == 'development'
  require 'dotenv'
  Dotenv.load
end

class Tweet

  def initialize
    @text = [
    "bonjour!",
    "いまなんじ？",
    "おやつ？",
    "ぽえーん",
    "さば？",
    "こんちは",
    "チョコレートたべる？",
    "ねむくない？",
    "なにしようかなー",
    "Comment allez-vous?",
    "ぼんじゅー",
    "おでかけします",
    "もぐもぐ",
    "ねむねむ",
    "ぷひー",
    "ﾃｯﾃﾚｰ!",
    "ぽえーん",
    "ふむふむ",
    "うひ",
    "ぶひ",
    "今日のごはんはなにかなー",
    "むしゃむしゃ",
    "あびあんと",
    "みにょーん",
    "パン！",
    "まぁそうなっちゃうよねー",
    "げんき？",
    "(^ω^)",
    "( ´∀｀)",
    "（ ﾟ∀ﾟ ）",
    "(´・ω・｀)",
    "ぼっとだよ",
    ]


    @cliant = Twitter::REST::Client.new do |config|
      config.consumer_key       = ENV['CONSUMER_KEY']
      config.consumer_secret    = ENV['CONSUMER_SECRET']
      config.oauth_token        = ENV['OAUTH_TOKEN']
      config.oauth_token_secret = ENV['OAUTH_TOKEN_SECRET']
    end
  end

  def random_tweet
    tweet = @text[rand(@text.length)]
    update(tweet)
  end

  def daily_tweet
    tweet = @text[Time.now.day - 1]
    update(tweet)
  end

  private
  def update(tweet)
    return nil unless tweet
    @cliant.update(tweet.chomp)
  end

end
