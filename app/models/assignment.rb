class Assignment < ActiveRecord::Base
	belongs_to :practice
	belongs_to :horse1, :class_name => 'Horse'
	belongs_to :horse2, :class_name => 'Horse'
	belongs_to :horse3, :class_name => 'Horse'
end
