require 'net/http'
require 'uri'
require 'json'
require 'date'

class String
  def yellow
    "\e[33m#{self}\e[0m"
  end

  def blue
    "\e[34m#{self}\e[0m"
  end
end

class OhMyDev
  def welcome_message
    puts 'Welcome to DEV-from-CLI 🎉🎉'
    puts ''
    puts <<~ABOUT_OH_MY_DEV
      DEV-from-CLI is a command line tool that allows you interact with Dev.to platform
    ABOUT_OH_MY_DEV

    puts "\n[1] View the latest articles on DEV.to\n[2] View articles using tags\n[3] Create article draft"

    print "\n> "
    user_initial_input = STDIN.gets.chomp
    oh_my_dev if user_initial_input == '1'

    return unless user_initial_input == '2'

    print "\nEnter special tag> "
    user_tag = STDIN.gets.chomp
    oh_my_dev user_tag if user_tag
  end

  private

  def make_request(tag = '')
    uri = URI.parse("https://dev.to/api/articles?tag=#{tag}")
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end

  def oh_my_dev(tag = '')
    response = make_request tag
    response.each do |item|
      puts "\n******************************".blue
      puts " #{'Title:'.yellow} #{item['title']}"
      puts " #{'Author:'.yellow} #{item['user']['name']} | #{'Created:'.yellow} #{item['readable_publish_date']} | #{'Tags:'.yellow} #{item['tags']}"
      puts " #{'Url:'.yellow} #{item['url']}"
      puts " #{'Description:'.yellow} #{item['description']}"
      puts '*******************************'.blue
      print "\nView more articles? [y/n] "
      input = STDIN.gets.chomp
      possible_input = %w[Y y]
      next if possible_input.include? input

      puts "\nSee you next time 😎😎"
      break
    end
  end

  def create_post_draft
    # TODO
    # 1. Read API to learn how to create article drafts
    # 2. Implement feature
  end
end

OhMyDev.new.welcome_message
