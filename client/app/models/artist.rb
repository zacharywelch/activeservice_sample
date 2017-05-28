class Artist < ActiveService::Base
  attribute :name
  attribute :rank
  attribute :featured, type: Boolean

  has_many :albums

  scope :featured, -> { where(featured: 't') }

  custom_get :ranked, :hot, on: :collection
end
