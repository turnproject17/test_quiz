class Answer < ApplicationRecord
  validates_presence_of :title
  
  belongs_to :answer
end
