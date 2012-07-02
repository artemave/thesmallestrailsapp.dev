%w(action_controller/railtie coderay).map &method(:require)

run TheSmallestRailsApp ||= Class.new(Rails::Application) {
  config.secret_token = routes.append { root to: 'hello#world' }.to_s
  initialize!
}

class HelloController < ActionController::Base
  def world
    render text: "
      <!DOCTYPE html>
      <title>#{title = "I am the smallest rails app!"}</title>
      <h3>#{title}</h3>
      <p>Here is my source code:</p>
      #{CodeRay.scan_file(__FILE__, :ruby).div(line_numbers: :table)}
      <a href='//goo.gl/YdRpy'>Make me smaller</a>
    "
  end
end
