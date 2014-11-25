# Whens
When(/^the (?:.*?) requests a list of (.*?)s?$/) do |type|
  get "/#{ type.pluralize.downcase.tr(' ', '-') }"
end

When(/^the (?:.*?) requests the (.*?)s? (?:of|named) (.*?)$/) do |type, name|
  get "/#{ type.pluralize.downcase.tr(' ', '-') }/#{ name.downcase.tr(' ', '-') }"
end

When(/^the (?:.*?) requests a new (.*?)$/) do |type|
  get "/#{ type.pluralize.downcase.tr(' ', '-') }/new"
end

When(/^the (?:.*?) requests (.*?)s? (?:of|named) (.*?) for (.*?)$/) do |type, name, op_name|
  get "/#{ type.pluralize.downcase.tr(' ', '-') }/#{ name.downcase.tr(' ', '-') }/#{ op_name }"
end

When(/^the (?:.*?) creates (.*?) with attrs$/) do |type, table|
  item = fill_item(table)
  post "/#{ type.pluralize.downcase.tr(' ', '-') }", item
end

When(/^the (?:.*?) edits (.*?)s? (?:of|named) (.*?) to attrs$/) do |type, name, table|
  item = fill_item(table)
  put "/#{ type.pluralize.downcase.tr(' ', '-') }/#{ name.downcase.tr(' ', '-') }", item
end

When(/^the (?:.*?) deletes the (.*?)s? (?:of|named) (.*?)s?$/) do |type, name|
  delete "/#{ type.pluralize.downcase.tr(' ', '-') }/#{ name.downcase.tr(' ', '-') }"
end

When(/^the (.*?) does (.*?)s? with attrs$/) do |type, action, table|
  item = fill_item(table)
  post "/#{ type.pluralize.downcase.tr(' ', '-') }/#{ action }", item
end

When(/^the (.*?) (?:.*?) (.*?)s? without attrs$/) do |type, action|
  post "/#{ type.pluralize.downcase.tr(' ', '-') }/#{ action }"
end


# Thens
Then(/^the response is successive result of (.*?)$/) do |op_name|
  # expect(last_response.status).to eq 200
  expect(last_response.successful?).to eq true
end

Then(/^the response is a list containing (#{CAPTURE_INT}) (.*?)s?$/) do |count, type|
  data = de_json last_response.body
  validate_list(data, of: type, count: count)
end

Then(/^the response is a (#{CAPTURE_INT}) (.*?)s? (?:of|named) (.*?)$/) do |count, type, name|
  data = de_json last_response.body
  expect(data).to be_a_kind_of(Hash)
end

Then(/^the response is a new empty (.*?)$/) do |type|
  data = de_json last_response.body
  expect(data).to be_a_kind_of(Hash)
end


# Ands
And(/(?:a|the) (#{CAPTURE_INT}) (?:.*?) ha(?:s|ve) the following attributes:$/) do |count, table|
  expected_item = fill_item(table)
  data = de_json last_response.body
  if data.is_a?(Array)
    matched_items = data.select { |item| item == expected_item }
    expect(matched_items.count).to eq(count)
  else
    expect(data).to eq(expected_item)
  end
end

# TODO fix WARNING ".downcase.tr(' ', '-')"

# TODO add typed parsing, e.g. "de_json data -> staff.class == Staff"