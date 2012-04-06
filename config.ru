require 'bundler/setup'
require 'rails'
require 'action_controller/railtie'
require 'net/http'
require 'uri'

class TheSmallestRailsApp < Rails::Application
  routes.append { root to: 'hello#world' }

  config.secret_token = 'not so secret but long enough to please rails'
  config.logger       = Logger.new STDOUT
end

class HelloController < ActionController::Base
  def world
    uri  = URI.parse 'http://hilite.me/api'
    form = {'lexer' => 'ruby', 'code' => File.read(__FILE__)}

    response = Net::HTTP.post_form uri, form

    render inline: %Q{
      <!DOCTYPE html>
      <html lang="en">
        <head>
          <title>The Smallest Rails App</title>
        </head>
        <body>
          <h3>I am the smallest rails app!</h3>
          <p>Here is my source code:</p>
          <p>#{response.body}</p>
          <a href="https://github.com/artemave/thesmallestrailsapp.com">Make me smaller</a>
        </body>
      </html>
    }
  end
end

TheSmallestRailsApp.initialize! rescue false # what could possibly go wrong?

run TheSmallestRailsApp
