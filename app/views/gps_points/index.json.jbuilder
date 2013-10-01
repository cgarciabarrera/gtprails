json.array!(@gps_points) do |gps_point|
  json.extract! gps_point, :latitude, :longitude
  json.url gps_point_url(gps_point, format: :json)
end
