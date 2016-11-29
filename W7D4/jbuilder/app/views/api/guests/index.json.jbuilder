json.array! @guests do |guest|
  # json.partial! 'api/guests/guest'
  json.name guest.name
  json.age guest.age
  json.favorite_color guest.favorite_color
  # json.gift guest.gift
end
