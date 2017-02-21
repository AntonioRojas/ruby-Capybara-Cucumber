###Install Ruby Dev Kit
Get the installer from [RubyInstaller](http://rubyinstaller.org)

When installing DevKit, pay attention to the config.yml as show [here](http://stackoverflow.com/a/30659530/18356)


###Install the following ruby gems:
```
gem install cucumber 
gem install capybara 
gem install selenium-webdriver
gem install selenium
gem install rspec
gem install capybara-screenshot
gem install sinatra
gem install rest_client
gem install json
```

By default, the test have been tested using Chrome. Depending on which browser you would like to use, 
you should copy the appropiate selenium driver to the "bin" directory in your local Ruby installation folder. 

For Chrome, you can find the [Selenium chrome driver](https://github.com/SeleniumHQ/selenium/wiki/ChromeDriver) here.

For Firefox, you can find the [Selenium firefox driver](https://github.com/mozilla/geckodriver/releases) here.

run it on the project folder
# cucumber -o features/reports/result.html
