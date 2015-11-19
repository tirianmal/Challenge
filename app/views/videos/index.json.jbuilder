json.array!(@videos) do |video|
  json.extract! video, :id, :name
  json.url video_url(video, format: :json)
end
