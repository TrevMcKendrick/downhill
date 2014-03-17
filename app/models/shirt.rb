class Shirt < ActiveRecord::Base
  belongs_to :participant

  SIZES = ["Male - Small", "Male - Medium", "Male - Large", "Male - XLarge", "Male - XXLarge", "Female - Small", "Female - Medium", "Female - Large", "Female - XLarge"]
end
