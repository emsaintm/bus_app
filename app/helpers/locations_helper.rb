module LocationsHelper

  # gets all the buses from the Atlanta Bus API
  def get_all_buses_from_api(bus_api_url)
    raw_http = Net::HTTP.get_response(URI.parse(bus_api_url))
    bus_data = raw_http.body 

    JSON.parse(bus_data)

  end

# turns it into an array of ruby hashes

  def is_nearby?(user_lat, user_long, bus_lat, bus_long, dist_max)


    difference_latitudes = user_lat - bus_lat.to_f
    difference_longitudes = user_long - bus_long.to_f



    distance = Math.sqrt(difference_latitudes ** 2 + difference_longitudes ** 2)



      case params[:max]
       when 1
        dist_max = 0.2.to_f
       when 2
        dist_max = 0.5.to_f
       when 3 
        dist_max = 1.0.to_f

      end

        distance <= dist_max

  end 
end


