json.extract! user, :id, :kod, :firstname, :lastname, :email, :rd, :phone, :phone_home, :created_at, :updated_at
json.url user_url(user, format: :json)