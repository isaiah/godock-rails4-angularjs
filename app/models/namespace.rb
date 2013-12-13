class Namespace < ActiveRecord::Base
  has_many :functions, dependent: :delete_all, as: :functional
  belongs_to :library
end
