# frozen_string_literal: true

RSpec::Matchers.define(:match_response_schema) do |schema|
  match do |response|
    schema_directory = "#{Dir.pwd}/spec/support/schemas/api/"
    schema_path = "#{schema_directory}/#{schema}.json"
    JSON::Validator.validate!(schema_path, response, strict: false)
  end
end
