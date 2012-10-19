# encoding: utf-8
require 'uri'
require 'net/http'
require 'net/https'

PUB_KEY = 'YOUR_PUB_KEY'
SECRET = 'YOUR_SECRET_KEY'
# The folling line of code records the url I used to get the TOKEN
# https://trello.com/1/authorize?response_type=token&scope=read,write,account&expiration=never&name=YOUR_APP_NAME&key=YOUR_PUB_KEY
TOKEN = 'YOUR_TOKEN'
LIST_ID = 'YOUR_LIST_ID'

def post_one_idea(title, content)
  sample_uri = "https://trello.com/1/cards"
  enc_uri = URI.escape(sample_uri)
  uri = URI.parse(enc_uri)
  https = Net::HTTP.new(uri.host, uri.port)
  https.use_ssl = true
  #req = Net::HTTP::Get.new(uri.path)
  path = uri.path
  data = "name=%s&desc=%s&idList=%s&key=%s&token=%s" % [title, content, LIST_ID, PUB_KEY, TOKEN]
  data = URI.escape(data)
  headers = {'Content-Type'=> 'application/x-www-form-urlencoded'}
  res, data = https.post(path, data, headers)
  puts res.code
  puts res.message
  return res.body
end
