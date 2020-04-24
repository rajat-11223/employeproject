class City < ApplicationRecord

has_many :employes

validates :name, uniqueness: { case_sensitive: false }
validates :name, presence: true
end
