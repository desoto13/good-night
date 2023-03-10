json.array! @sleep_records do |record|
  json.user do
    json.name record.user.name
  end
  json.id record.id
  json.user_id record.user_id
  json.clock_in record.clock_in
  json.clock_out record.clock_out
  json.sleep_length record.sleep_length
end