class User < ActiveRecord::Base
has_many :expenses
has_many :assignments
has_many :groups,through: :assignments
end
