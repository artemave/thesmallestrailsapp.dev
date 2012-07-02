%w(action_controller/railtie coderay).map &method(:require)

run TheSmallestRailsApp ||= Class.new(Rails::Application) {
  config.secret_token = routes.append { root to: proc{[200, {"Content-Type" => "text/html"}, ["
    <!DOCTYPE html>
    <title>#{@title = 'The Smallest Rails App'}</title>
    <h3>I am #{@title}!</h3>
    <p>Here is my source code:</p>
    #{CodeRay.scan_file(__FILE__, :ruby).div(line_numbers: :table)}
    <a href='//goo.gl/YdRpy'>Make me smaller</a>
  "]]} }.to_s
  config.threadsafe!
  initialize!
}
