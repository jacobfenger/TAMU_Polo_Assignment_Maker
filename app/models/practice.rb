class Practice < ActiveRecord::Base
	belongs_to :user
	has_many :assignment
	validates :time, presence: true
	validates :date, presence: true
	validates :summary, presence: true
end
