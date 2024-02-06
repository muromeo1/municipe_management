class Address < ApplicationRecord
  belongs_to :municipe

  validates :cep, :street, :neighborhood, :city, :state, presence: true
end
