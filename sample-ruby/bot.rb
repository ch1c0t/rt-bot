require 'hobby'
require 'json'

class Bot
  ID = 'sample-ruby'

  include Hobby::App
  use Rack::ContentType, 'application/json'

  post '/event' do
    begin
      text = (JSON.parse request.body.read)['text']
      response.status = 201
      { bot: ID, text: text.reverse }.to_json
    rescue
      response.status = 417
    end
  end
end
