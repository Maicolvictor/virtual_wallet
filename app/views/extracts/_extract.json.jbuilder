json.extract! extract, :id, :transaction_type, :amount, :account_id, :wallet_id, :created_at, :updated_at
json.url extract_url(extract, format: :json)
