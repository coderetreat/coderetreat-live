module ApplicationHelper
  def google_map_image_for(city)
    "https://maps.googleapis.com/maps/api/staticmap?markers=#{city}&size=100x100&zoom=1" +
    "&style=feature:all|element:labels|visibility:off"
  end
end
