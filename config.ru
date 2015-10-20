Bundler.require

run TheSmallestRailsApp ||= Class.new(Rails::Application) {
  config.secret_key_base = routes.append {
    root to: -> {
      [200, {"Content-Type" => "text/html"}, [Markaby::Builder.new.html {
        title @title = "The Smallest Rails App"
        h3 "I am #@title!"
        p "Here is my source code:"
        text CodeRay.scan_file(__FILE__).div(line_numbers: :table)
        p { a "Make me smaller", href: "//goo.gl/YdRpy" }
      }]]
    }
  }.to_s
  initialize!
}
