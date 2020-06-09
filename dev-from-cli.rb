require 'dotenv'
require 'net/http'
require 'uri'
require 'json'
Dotenv.load

##
# Extends the +String+ class by adding utility methods
# for string coloring
class String
  def yellow
    "\e[33m#{self}\e[0m"
  end

  def blue
    "\e[34m#{self}\e[0m"
  end
end

##
# This is the main class
class DevFromCli
  ##
  # This method outputs a welcome message and prompts
  # for inputs depending on what they want to achieve
  # for using the program
  #
  # @return oh_my_dev
  def introduction
    puts 'Welcome to DEV-from-CLI 🎉🎉'
    puts ''
    puts <<~ABOUT_OH_MY_DEV
      DEV-from-CLI is a command line tool that allows you interact with Dev.to platform
    ABOUT_OH_MY_DEV

    puts "\n[1] View the latest articles on DEV.to\n[2] View articles using tags\n[3] Create article draft\n[4] Exist"

    print "\n> "
    user_initial_input = STDIN.gets.chomp
    response_output if user_initial_input == '1'
    create_post_draft if user_initial_input == '3'
    puts "\nWow! did you make a mistake? Anyways, see you soon 😪" if user_initial_input == '4'

    return unless user_initial_input == '2'

    print "\nEnter special tag> "
    user_tag = STDIN.gets.chomp
    response_output user_tag if user_tag
  end

  private
  ##
  # Sends http GET request to the Dev.to backend API
  def fetch_articles(tag = '')
    uri = URI.parse("https://dev.to/api/articles?tag=#{tag}")
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end

  ##
  # Output's response from Dev.to to users based
  # on the choice from the welcome prompt.
  # @return String
  def response_output(tag = '')
    articles = fetch_articles tag
    articles.each do |item|
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

  ##
  # Creates article draft on Dev.to by making
  # a http POST request to the articles endpoint
  # @return String
  def create_post_draft
    print "\nFollow the prompt to create an article\nEnter title for your article> "
    title = STDIN.gets.chomp
    print 'Enter tags> '
    tag1 = STDIN.gets.chomp
    print 'Enter draft content> '
    content = STDIN.gets.chomp
    body = { article: { title: title, published: false, body_markdown: content, tags: [tag1] } }

    uri = URI.parse('https://dev.to/api/articles')
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri)
    request['Content-Type'] = 'application/json'
    request['api-key'] = ENV['API_KEY']
    http.use_ssl = (uri.scheme == 'https')
    request.body = body.to_json
    puts "\nCreating your article draft ⚡⚡\n"

    response = http.request(request)
    puts "\nThere was an error: #{response}" if response.msg != 'Created'
    puts 'Your article was successfully created'
    response_json = JSON.parse(response.body)
    puts "URL: #{response_json['url']}"
  end
end

DevFromCli.new.introduction
