require 'sinatra/base'
require 'base64'

module GitlabHookProxy
  class Api < Sinatra::Base
    proxy_action = lambda do
      body = request.body.read
      payload = Base64.encode64(body.empty? ? '{}' : body)
      `curl -d "payload=#{payload}" #{params[:job_url]}`
    end
    get '/', &proxy_action
    post '/', &proxy_action
  end
end