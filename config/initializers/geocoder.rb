# config/initializers/geocoder.rb
# frozen_string_literal: true

if Rails.env.production?
  Geocoder.configure(
    # or any other geocoding service like :nominatim, :mapbox, etc.
    lookup: :google,
    # Replace with the environment variable for your production API key
    api_key: ENV['GOOGLE_API_KEY'],
    timeout: 5,
    units: :km
  )
else
  # In development, you can either mock the geocoding service or simply disable it
  Geocoder.configure(
    # This prevents actual geocoding API calls during development and testing
    lookup: :test
  )

  # Optionally, mock specific locations for testing
  Geocoder::Lookup::Test.add_stub(
    '1600 Pennsylvania Ave NW, Washington, DC 20500, USA',
    [
      {
        'latitude' => 38.8976633,
        'longitude' => -77.0365739,
        'address' => '1600 Pennsylvania Ave NW, Washington, DC 20500, USA',
        'state' => 'District of Columbia',
        'country' => 'United States'
      }
    ]
  )
end
