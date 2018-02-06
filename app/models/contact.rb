class Contact < ApplicationRecord
  validates_presence_of :full_name, :position, :email
  belongs_to :company
end
