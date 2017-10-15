class Picture

  # init: function(){_500px.init({
  #     sdk_key: 'a7b09a291baf4d118ba963cbf688188645447e3a'
  #   })},
  include HTTParty
  base_uri 'https://api.500px.com/v1/photos'
  default_params sdk_key: 'a7b09a291baf4d118ba963cbf688188645447e3a'
  format :json
  #
  # feature=popular
  # sort=rating
  # image_size = 3
  # include_store = store_download
  # include_states = voted
end
