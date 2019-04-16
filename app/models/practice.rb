class Practice < ActiveRecord::Base
	belongs_to :user
	validates :time, presence: true
	validates :date, presence: true
	validates :summary, presence: true
end
