class Horse < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	has_many :assignments, :class_name => 'Assignment', :foreign_key => 'horse1_id'
	has_many :assignments, :class_name => 'Assignment', :foreign_key => 'horse2_id'
	has_many :assignments, :class_name => 'Assignment', :foreign_key => 'horse3_id'
	# Ensures that the required fields are filled out
	# when inputting a horse.
	def has_required_fields?
		self.name && self.age
	end
end
