require 'net/http'
require 'json'
require 'byebug'

def json_response uri
  JSON.parse(Net::HTTP.get(URI(uri))).to_hash
end

def end_points
  json_response "https://fpr.archivematica.org/fpr/api/v2/?format=json"
end

def info id
  json_response "https://fpr.archivematica.org/fpr/api/v2/format-version/?pronom_id=#{id}&format=json"
end

def rules uuid, mode
  json_response "https://fpr.archivematica.org/fpr/api/v2/fp-rule/?purpose=#{mode}&format=json&fmt=#{uuid}"
end

def command uuid
  json_response "https://fpr.archivematica.org/fpr/api/v2/fp-command/?format=json&uuid=#{uuid}"
end

def tool uuid
  json_response "https://fpr.archivematica.org/fpr/api/v2/fp-tool/?format=json&uuid=#{uuid}"
end

puts "\nEndpoints:"
puts end_points
puts "\nInfo:"
puts info("fmt/4")
puts "\nRules:"
puts rules("6370b72f-4caa-4d90-abc6-4816c8a0a603", "access")
puts "\nCommand:"
puts command "6957fdac-a1ed-470f-89f7-fb00be42ea13"
puts "\nTool:"
puts tool "8d81cd4f-20ee-4a82-9eca-455699509cd5"


