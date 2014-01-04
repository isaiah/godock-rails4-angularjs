class TypeClass < ActiveRecord::Base
  include PgSearch
  has_many :functions, dependent: :delete_all, as: :functional

  belongs_to :namespace

  has_many :examples, as: :examplable
  multisearchable against: [:name]
end
