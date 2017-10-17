class Picture

  # 
  include HTTParty
  base_uri 'https://api.500px.com/v1/photos'
  default_params sdk_key: 'use your api key here'
  format :json
  #
  # feature=popular
  # sort=rating
  # image_size = 3
  # include_store = store_download
  # include_states = voted
end
