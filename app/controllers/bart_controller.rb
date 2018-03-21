require 'net/http'
require 'json'

class BartController < ApplicationController
  def index
    bart_url = 'http://api.bart.gov/api/etd.aspx?key=MW9S-E7SL-26DU-VV8V&json=y&cmd=etd&orig=12TH&plat=2'
    escaped_address = URI.escape(bart_url)
    uri = URI.parse(escaped_address)
    bart_info = Net::HTTP.get(uri)
    bart_info = JSON.parse(bart_info)

    routes = bart_info['root']['station'][0]['etd']

    sf_routes = routes.select {|route| ['SFIA', 'MLBR'].include?(route['abbreviation'])}

    upcoming_trains = []
    upcoming_times = []

    sf_routes.each do |route|
      upcoming_trains_for_this_route = route['estimate'].map {|train| train['minutes'].to_i}
      upcoming_times += upcoming_trains_for_this_route

      upcoming_trains << {
        name: route['destination'],
        times: upcoming_trains_for_this_route
      }
    end


    next_train = upcoming_times.sort.select{|time| time > 7}.first

    train_info = {
      next_train: next_train,
      all_trains: upcoming_trains
    }

    render json: train_info
  end
end
