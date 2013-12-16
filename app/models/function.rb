class Function < ActiveRecord::Base
  belongs_to :functional, polymorphic: true
  belongs_to :struct
  has_many :examples, as: :examplable
end
