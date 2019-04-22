json.extract! lead, :id, :first_name, :last_name, :phone, :email, :issue, :created_at, :updated_at
json.url lead_url(lead, format: :json)
