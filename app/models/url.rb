class Url < ApplicationRecord
  validates :large_url, presence: true
  validates :large_url, format: URI::regexp(%w[http https])
end
