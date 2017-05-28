class Song < ActiveService::Base
  attribute :name
  attribute :album_id
  attribute :rank

  belongs_to :album

  scope :page, ->(n) { where(page: n) }
  scope :per,  ->(n) { where(per_page: n) }

  custom_get :top_25, :hot, on: :collection
end
