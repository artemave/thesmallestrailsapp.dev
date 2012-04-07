%w(action_controller/railtie coderay).each &method(:require)

class TheSmallestRailsApp < Rails::Application
  config.secret_token = routes.append { root to: 'hello#world' }.inspect
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
          #{code}
          <a href="https://github.com/artemave/thesmallestrailsapp.com">Make me smaller</a>
        </body>
      </html>
    }
  end
end

TheSmallestRailsApp.initialize! rescue false # or be shot by heroku
run TheSmallestRailsApp
