class Movie < ApplicationRecord
  has_many :ratings
  has_many :reviewers, through: :ratings, source: :user
end
