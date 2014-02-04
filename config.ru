require "bundler/setup"
Bundler.require

run Class.new(Rails::Application) {
  config.secret_token = routes.append {
    root to: proc {
      [200, {"Content-Type" => "text/html"}, [Markaby::Builder.new.html {
        title @title = "The Smallest Rails App"
        h3 "I am #@title!"
        p "Here is my source code:"
        text CodeRay.scan_file(__FILE__).div(line_numbers: :table)
        p { a "Make me smaller", href: "//goo.gl/YdRpy" }
      }]]
    }
  }.to_s
  initialize! unless @initialized
}
