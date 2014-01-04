class Namespace < ActiveRecord::Base
  include PgSearch

  belongs_to :library
  has_many :functions, dependent: :delete_all, as: :functional
  has_many :struct_types, dependent: :delete_all
  has_many :interface_types, dependent: :delete_all

  multisearchable against: [:name]
end
