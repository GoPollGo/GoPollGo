require 'httparty'
require 'json'

module GoPollGo
  class GoPollGoError       < StandardError; end
  class Unauthorized        < StandardError; end
  class BadArguments        < StandardError; end
  class UnknownResponseCode < StandardError; end
  
  
  class Client
    include HTTParty

    base_uri 'http://gopollgo.com/api'
    
    format :json
    
    def initialize(key)
      @key = key
    end
    
    def create_poll(question, options)
      response = self.class.post('/polls',
        :query => { :key => @key },
        :body  => {
          :question => question,
          :options  => options
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