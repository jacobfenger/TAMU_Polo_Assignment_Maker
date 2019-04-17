class Practice < ActiveRecord::Base
	belongs_to :user
	has_many :assignments
	validates :time, presence: true
	validates :date, presence: true
	validates :summary, presence: true

	def has_required_fields?
		self.time && self.date && self.summary
	end
end
