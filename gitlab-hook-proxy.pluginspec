Jenkins::Plugin::Specification.new do |plugin|
  plugin.name = "gitlab-hook-proxy"
  plugin.display_name = "Gitlab Hook Proxy Plugin"
  plugin.version = '0.0.1'
  plugin.description = 'gitlab-hook-proxy-plugin is gitlab webhook proxy for jenkins.'

  # You should create a wiki-page for your plugin when you publish it, see
  # https://wiki.jenkins-ci.org/display/JENKINS/Hosting+Plugins#HostingPlugins-AddingaWikipage
  # This line makes sure it's listed in your POM.
  plugin.url = 'https://wiki.jenkins-ci.org/display/JENKINS/Gitlab+Hook+Proxy+Plugin'

  # The first argument is your user name for jenkins-ci.org.
  plugin.developed_by "galapagos", "galapagos <kenta.motoyanagi@glpgs.com>"

  # This specifies where your code is hosted.
  # Alternatives include:
  #  :github => 'myuser/gitlab-hook-proxy-plugin' (without myuser it defaults to jenkinsci)
  #  :git => 'git://repo.or.cz/gitlab-hook-proxy-plugin.git'
  #  :svn => 'https://svn.jenkins-ci.org/trunk/hudson/plugins/gitlab-hook-proxy-plugin'
  plugin.uses_repository :github => "gitlab-hook-proxy-plugin"

  # This is a required dependency for every ruby plugin.
  plugin.depends_on 'ruby-runtime', '0.10'

  # This is a sample dependency for a Jenkins plugin, 'git'.
  #plugin.depends_on 'git', '1.1.11'
end
