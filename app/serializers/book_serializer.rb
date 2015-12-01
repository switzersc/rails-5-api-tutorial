class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :page_count, :description, :created_at
end
