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

    hue_url_get = hue_url = ENV['HUE_AUTH'] + '/lights'
    get_req = Net::HTTP::Get.new(hue_url_get)
    get_resp = Net::HTTP.new(ENV['HUE_HOST']).start {|http| http.request(get_req) }
    json_get_resp = JSON.parse(get_resp.body)
    if json_get_resp["12"]["state"]["on"] && json_get_resp["16"]["state"]["on"]

      hue_url = ENV['HUE_AUTH'] + '/lights/12/state'
      hue_url2 = ENV['HUE_AUTH'] + '/lights/16/state'
      p hue_url
      req = Net::HTTP::Put.new(hue_url)
      req2 = Net::HTTP::Put.new(hue_url2)
      p ENV['HUE_HOST']
      req.body = '{"on":true, "bri":254,"hue": ' + color + '}'
      req2.body = '{"on":true, "bri":254,"hue": ' + color + '}'
      p "Sending call to light"
      response = Net::HTTP.new(ENV['HUE_HOST']).start {|http| http.request(req) }
      response2 = Net::HTTP.new(ENV['HUE_HOST']).start {|http| http.request(req2) }
      p "Sent call to light"
      p response.body
      p response2.body
      return response.body
    end
    p "Lights are not on"
    return
  end
end
