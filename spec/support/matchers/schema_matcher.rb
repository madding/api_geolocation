RSpec::Matchers.define :match_schema do |schema|
  match do |response|
    schema_directory = "#{Dir.pwd}/spec/schemas"
    parameters = response.request.parameters
    schema_path = "#{schema_directory}/#{parameters['controller']}/#{parameters['action']}.json"
    fail "No such schema: #{schema_path}" unless File.exist?(schema_path)
    JSON::Validator.validate!(schema_path, response.body, strict: true)
  end
end
