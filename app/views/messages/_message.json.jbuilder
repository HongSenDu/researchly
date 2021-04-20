json.extract! message, :id, :user_id, :recipient_id, :group_id, :subject, :body, :read, :show_user, :show_recipient, :created_at, :updated_at
json.url message_url(message, format: :json)
