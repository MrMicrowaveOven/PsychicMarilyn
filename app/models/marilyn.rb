require 'net/http'

class Marilyn < ApplicationRecord
  def self.set_light(urgency)
    color = case urgency
            when 0
              '1'
            when 1
              '50536'
            when 2
              '44536'
            end
    hue_url = ENV['HUE_AUTH'] + '/lights/12/state'
    req = Net::HTTP::Put.new(hue_url)

    req.body = '{"on":true, "bri":254,"hue": ' + color + '}'
    p "Sending call to light"
    response = Net::HTTP.new(ENV['HUE_HOST']).start {|http| http.request(req) }
    p "Sent call to light"
    response.body

  end
end
