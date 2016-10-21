require 'jenkins/rack'

require_relative 'unprotected_root_action'
require_relative 'api'

module GitlabHookProxy
  class Main < Jenkins::Model::UnprotectedRootAction
    include Jenkins::Model::DescribableNative
    include Jenkins::RackSupport

    display_name 'Gitlab Hook Proxy'
    icon nil
    url_path 'gitlab-proxy'

    def call(env)
      Api.new.call(env)
    end
  end
end

Jenkins::Plugin.instance.register_extension(GitlabHookProxy::Main.new)
