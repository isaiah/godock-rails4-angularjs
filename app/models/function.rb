class Function < ActiveRecord::Base
  belongs_to :functional, polymorphic: true
end
