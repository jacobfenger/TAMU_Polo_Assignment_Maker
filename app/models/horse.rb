class Horse < ActiveRecord::Base
	# Ensures that the required fields are filled out
	# when inputting a horse.
	def has_required_fields?
		self.name && self.age
	end
end
