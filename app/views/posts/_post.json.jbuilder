json.extract! post, :id, :message, :fb_id, :updated_time, :group_id, :created_at, :updated_at
json.url post_url(post, format: :json)
