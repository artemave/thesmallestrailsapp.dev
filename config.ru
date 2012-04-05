require "bundler/setup"
require "rails"
require "action_controller/railtie"

class TheSmallestRailsApp < Rails::Application
  routes.append do
    root to: 'hello#index'
  end

  config.secret_token = "asdf8sadfas8dlj2342b3bv23bvn23o3u"
  config.logger       = Logger.new STDOUT
end

require 'net/http'
require 'uri'

class HelloController < ActionController::Base
  def index
    uri  = URI.parse('http://hilite.me/api')
    form = {'lexer' => 'ruby', 'code' => File.read(__FILE__)}

    response = Net::HTTP.post_form uri, form

    render inline: %Q{
      <!DOCTYPE html>
      <html lang="en">
        <head>
          <meta charset="utf-8">
          <title>The Smallest Rails App</title>
        </head>
        <body>
          <h3>I am the smallest rails app!</h3>
          <p>Here is my source code:</p>
          #{response.body}
        </body>
      </html>
    }
  end
end

TheSmallestRailsApp.initialize!

run TheSmallestRailsApp
