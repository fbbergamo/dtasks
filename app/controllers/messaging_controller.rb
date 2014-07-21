 
class MessagingController < ApplicationController
  include ActionController::Live
 
  def index
  end
 
  def stream
    response.headers['Content-Type'] = 'text/event-stream'
    begin

      if current_user
	      loop do
	      	response.stream.write("ola")
	      	sleep 10
	      end
	  end
    rescue IOError
    ensure
    	puts "connection close"
    	response.stream.close
    end
  end
end