json.extract! admin, :id, :kod, :firstname, :lastname, :email, :rd, :phone, :phone_home, :created_at, :updated_at
json.url admin_url(admin, format: :json)