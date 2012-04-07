require 'bundler/setup'
require 'action_controller/railtie'
require 'coderay'

class TheSmallestRailsApp < Rails::Application
  routes.append { root to: 'hello#world' }
  config.secret_token = 'a'*30
end

class HelloController < ActionController::Base
  def world
    code = CodeRay.scan(File.read(__FILE__), :ruby).div(line_numbers: :table)

    render inline: %Q{
      <!DOCTYPE html>
      <html lang="en">
        <head>
          <title>The Smallest Rails App</title>
        </head>
        <body>
          <h3>I am the smallest rails app!</h3>
          <p>Here is my source code:</p>
          <p>#{code}</p>
          <a href="https://github.com/artemave/thesmallestrailsapp.com">Make me smaller</a>
        </body>
      </html>
    }
  end
end

run TheSmallestRailsApp.tap &:initialize!
