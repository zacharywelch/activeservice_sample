class Artist < ActiveService::Base
  attribute :name
  attribute :rank
  attribute :featured, type: Boolean
  attribute :created_at, type: DateTime
  attribute :updated_at, type: DateTime

  has_many :albums

  scope :featured, -> { where(featured: true) }

  custom_get :ranked, :hot, on: :collection
end
