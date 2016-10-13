
Capybara.javascript_driver = :webkit
Capybara::Webkit.configure do |config|
  config.allow_url("google-code-prettify.googlecode.com")
  config.allow_url("https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js")
 end
