module PracticesHelper
	def has_required_fields?
		self.time && self.date && self.summary
	end
end
