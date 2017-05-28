class Artist < ActiveService::Base
  attribute :name
  attribute :featured, type: Boolean
  attribute :rank

  has_many :albums

  scope :featured, -> { where(featured: 't') }

  custom_get :ranked, :hot, on: :collection
end
