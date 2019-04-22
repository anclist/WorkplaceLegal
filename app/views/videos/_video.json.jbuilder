json.extract! video, :id, :title, :url, :video_id, :provider, :created_at, :updated_at
json.url video_url(video, format: :json)
