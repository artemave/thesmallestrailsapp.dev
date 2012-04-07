%w(action_controller/railtie coderay).each &method(:require)

run class TheSmallestRailsApp < Rails::Application
  config.secret_token = routes.append { root to: 'hello#world' }.inspect
  tap &:initialize!
end

class HelloController < ActionController::Base
  def world
    code = CodeRay.scan_file(__FILE__, :ruby).div(line_numbers: :table)

    render inline: %Q{
      <!DOCTYPE html>
      <title>The Smallest Rails App</title>
      <h3>I am the smallest rails app!</h3>
      <p>Here is my source code:</p>
      #{code}
      <a href="https://github.com/artemave/thesmallestrailsapp.com">Make me smaller</a>
    }
  end
end