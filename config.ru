%w(action_controller/railtie coderay markaby).map &method(:require)

run TheSmallestRailsApp ||= Class.new(Rails::Application) {
  config.secret_token = routes.append {
    root to: proc {
      [200, {"Content-Type" => "text/html"}, [Markaby::Builder.new.html {
        title @title = "The Smallest Rails App"
        h3 "I am #@title!"
        p "Here is my source code:"
        div { CodeRay.scan_file(__FILE__, :ruby).div(line_numbers: :table) }
        a "Make me smaller", href: "//goo.gl/YdRpy"
      }]]
    }
  }.to_s
  initialize!
}
