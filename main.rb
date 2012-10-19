require_relative 'parser'
require_relative 'connector'

idea_list = parse('data/WIKI_CONTENT.md')
count = idea_list.length
idea_list.each_with_index do |item, index|
  title, content = item
  puts 'Posting No.%d out of %d - %s' % [index + 1, count, title]
  post_one_idea title, content
end
