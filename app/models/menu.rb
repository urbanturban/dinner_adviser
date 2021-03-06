class Menu < ActiveRecord::Base
	include Categorizable
	belongs_to :user
	has_and_belongs_to_many :courses
	has_many :products, through: :courses

	accepts_nested_attributes_for :courses,
		:reject_if => proc { |attrs|
		attrs['name'].blank? &&
		attrs['course_id'].blank?
	}

	validates :date, presence: true
	validates :user_id, presence: true

	default_scope { order(date: :desc) }
end
