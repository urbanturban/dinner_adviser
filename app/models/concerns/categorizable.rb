module Categorizable
	extend ActiveSupport::Concern

	included do
		belongs_to :category, class_name: "#{name}Category", foreign_key: "category_id"
		accepts_nested_attributes_for :category,
		:reject_if => proc { |attrs|
			attrs['name'].blank? &&
			attrs['category_id'].blank?
		}
		scope :without_category, -> { where(category_id: nil) }
	end


  	# методы класса
  	module ClassMethods

  	end

	  # инстанс-методы
	  module InstanceMethods

	  end
	end
