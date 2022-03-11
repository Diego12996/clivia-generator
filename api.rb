require "httparty"
require "json"

module Services
  
    include HTTParty

    base_uri("https://opentdb.com/api.php?")

    def self.funcion
      response = get('amount=10')
      a = JSON.parse(response.body, symbolize_names: true)
      a[:results]
    end

end

a = Services.funcion
p a