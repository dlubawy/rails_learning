class Kitten < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 20}
  validates :age, presence: true, :numericality => {:greater_than => 0, :less_than_or_equal_to => 30}
end
