require 'rubygems'

$: << File.join(File.dirname(__FILE__), "lib")
require 'cramp/controller'

class StreamController < Cramp::Controller::Base
  periodic_timer :send_data, :every => 1
  periodic_timer :check_limit, :every => 10

  def send_data
    render ["Hello World", "\n"]
  end

  def check_limit
    finish
  end

end

Rack::Handler::Thin.run StreamController, :Port => 3000
