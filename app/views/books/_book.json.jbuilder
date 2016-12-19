json.extract! book, :id, :kod, :name, :ddc, :count, :isbn, :writer, :write_date, :type_id, :created_at, :updated_at
json.url book_url(book, format: :json)