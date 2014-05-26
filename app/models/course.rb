class Course < ActiveRecord::Base
	belongs_to :user
	belongs_to :course_kind
	has_many :ingridients,  dependent: :destroy
	has_many :products, through: :ingridients

	accepts_nested_attributes_for :ingridients,
		allow_destroy: true,
		:reject_if => proc { |attrs|
			attrs['name'].blank? &&
			attrs['product_id'].blank?
		}

	validates :name, presence: true, length: {maximum: 100}

	def available?
    self.products.where(available: false).count == 0 && self.products.count > 0
	end

	scope :availabled, -> {select(&:available?)}
end
