json.extract! user, :id, :fname, :lname, :email, :password, :user_type, :created_at, :updated_at
json.url user_url(user, format: :json)
