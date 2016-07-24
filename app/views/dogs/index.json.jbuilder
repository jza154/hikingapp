json.array!(@dogs) do |dog|
  json.extract! dog, :id, :name, :breed, :age, :gender, :weight, :about
  json.url dog_url(dog, format: :json)
end
