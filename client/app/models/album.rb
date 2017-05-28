class Album < ActiveService::Base
  attribute :name
  attribute :released_at, type: DateTime
  attribute :rank
  attribute :artist_id

  belongs_to :artist
  has_many :songs

  scope :released_today, -> { where(released_at: Date.current) }

  custom_get :recent, :ranked, :hot, on: :collection
end
