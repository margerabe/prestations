class GeocodingService
  include HTTParty
  base_uri "https://api-adresse.data.gouv.fr"

  def initialize(address)
    @address = address
  end

  def call
    response = self.class.get("/search", query: { q: @address, limit: 1 })["features"]&.first
    return {} if response.nil?

    coordinates = response.dig("geometry", "coordinates")
    {
      lat: coordinates.second,
      lng: coordinates.first
    }.merge(response["properties"].transform_keys(&:to_sym))
  end
end
