module QuestionsHelper
  Dotenv.load
  include HTTParty
  base_uri 'api.github.com'
  
  def vote_count(question)
    question.votes.count 
  end

  def github_welcome
    token = ENV['GITHUB_TOKEN']
    url = 'https://api.github.com/zen'
    email = ENV['EMAIL']
    password = ENV['PASSWORD']
    # auth = {username: email, password: password }
    # response = HTTParty.get(url, basic_auth: auth)
    quote_call = HTTParty.get("https://api.github.com/zen", :headers => {"Authorization" => "token #{token}", "User-Agent" => ENV['EMAIL']})
    return quote_call
    
  end
end
