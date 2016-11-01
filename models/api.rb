require 'sinatra/base'

module GitlabHookProxy
  class Api < Sinatra::Base
    proxy_action = lambda do
      body = request.body.read
      payload = escape_json(body.empty? ? '{}' : body)
      `curl -d "payload=#{payload}" #{params[:job_url]}`
    end
    get '/', &proxy_action
    post '/', &proxy_action

    private

    JSON_ESCAPE_MAP = {
      '\\'   => '\\\\',
      '</'   => '<\/',
      "\r\n" => '\n',
      "\n"   => '\n',
      "\r"   => '\n',
      '"'    => '\\"'
    }

    def escape_json(json)
      json.gsub(/(\\|<\/|\r\n|[\n\r"])/) { JSON_ESCAPE_MAP[$1] }
    end
  end
end