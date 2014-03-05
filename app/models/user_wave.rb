class UserWave < ActiveRecord::Base
  belongs_to :user
  belongs_to :wave
end
