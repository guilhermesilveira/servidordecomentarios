class Local < ApplicationRecord
	has_many :comentarios, -> { order "created_at DESC"}
end
