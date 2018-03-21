require 'net/http'

class Marilyn < ApplicationRecord
  def self.set_light(urgency)
    p "Marilyn is in the building"
    color = case urgency
            when 0
              '1'
            when 1
              '50536'
            when 2
              '44536'
            end
    hue_url = ENV['HUE_AUTH'] + '/lights/12/state'
    p hue_url
    req = Net::HTTP::Put.new(hue_url)
    p ENV['HUE_HOST']
    req.body = '{"on":true, "bri":254,"hue": ' + color + '}'
    p "Sending call to light"
    response = Net::HTTP.new(ENV['HUE_HOST']).start {|http| http.request(req) }
    p "Sent call to light"
    p response.body
    response.body

  end
end
