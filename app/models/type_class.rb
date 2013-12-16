class TypeClass < ActiveRecord::Base
  has_many :function, dependent: :delete_all, as: :functional

  belongs_to :namespace

  has_many :examples, as: :examplable
end
