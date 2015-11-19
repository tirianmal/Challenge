json.array!(@badges) do |badge|
  json.extract! badge, :id, :name, :fa_symbol
  json.url badge_url(badge, format: :json)
end
