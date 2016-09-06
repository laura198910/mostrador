class Categorium < ActiveRecord::Base
	validates :nombre, presence:true
end
