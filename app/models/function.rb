class Function < ActiveRecord::Base
  include PgSearch
  belongs_to :functional, polymorphic: true
  belongs_to :struct
  has_many :examples, as: :examplable
  multisearchable against: [:name]
end
