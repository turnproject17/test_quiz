class User < ApplicationRecord
  validates_presence_of :session_id, :full_name, :contact_number

  validates_uniqueness_of :session_id
  
  has_and_belongs_to_many :questions
end
