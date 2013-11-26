json.array!(@softwares) do |software|
  json.extract! software, :name, :url, :operating_system_id, :description, :download_count, :state_id
  json.url software_url(software, format: :json)
end
