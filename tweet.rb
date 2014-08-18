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
    "bonjour !",
    "今日もいい日だ",
    "ノシ",
    "おやつの時間",
    "なにしてるの？",
    "T’exagères, quand même !",
    "Je m'ennuie.",
    "une petite trentaine",
    "かまへん、かまへん",
    "Comment allez-vous ?",
    "ぼんじゅー",
    "C'est mignon !",
    "C'est fascinant !",
    "Ce n'est pas péjoratif.",
    "ほんまやなー",
    "ﾃｯﾃﾚｰ!",
    "Il m'a confie le chocolat.",
    "une petite distance",
    "いかがおすごしですか",
    "Je suis trés timide.",
    "今日のごはんはなにかなー",
    "Il reste 10 jour.",
    "À bientôt !",
    "Il camoufle le probleme.",
    "hi",
    "Tu m'empêche de dormir.",
    "げんき？",
    "À tout à l'heurei.",
    "Éloge de la fuite.",
    "どないしたん",
    "Il veut prendre sa revanche.",
    "ぼっとだよ",
    ]


    @cliant = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['CONSUMER_KEY']
      config.consumer_secret     = ENV['CONSUMER_SECRET']
      config.access_token        = ENV['OAUTH_TOKEN']
      config.access_token_secret = ENV['OAUTH_TOKEN_SECRET']
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
