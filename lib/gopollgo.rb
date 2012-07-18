require 'httparty'
require 'json'

module GoPollGo
  class GoPollGoError       < StandardError; end
  class Unauthorized        < StandardError; end
  class BadArguments        < StandardError; end
  class UnknownResponseCode < StandardError; end
    
  class Client
    include HTTParty

    base_uri 'http://gopollgo/api'
    
    format :json
    
    # In order to use the write portions of the API, you'll need an API key.
    # If this is left blank, you'll still be able to use read-only portions
    # of the API.
    def initialize(key=nil)
      @key = key
    end
    
    # Create a poll on GoPollGo
    def create_poll(poll)
      response = self.class.post('/polls',
        :query => { :key => @key },
        :body  => {
          :question => poll[:question],
          :options  => poll[:options]
        }
      )
      
      case response.code
        when 200
          return JSON.parse(response.body)
        when 400
          raise BadArguments, "Bad Arguments.  Please check your poll parameters."
        when 401
          raise Unauthorized, "Access denied.  Check your API key."
        when 500
          raise GoPollGoError, "GoPollGo Internal Error.  Please try again in a second.  If this persists, please contact dev@gopollgo.com"
        else
          raise UnknownResponseCode, "Unexpected Status: #{response.code}"
      end
    end

  end


end