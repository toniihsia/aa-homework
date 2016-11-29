json.array! @gifts.each do |gift|
  json.extract! gift, :title
end
