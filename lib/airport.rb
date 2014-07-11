require_relative 'plane'

class Airport

	DEFAULT_CAPACITY = 25

	def planes
		@planes ||= []
	end

	def land(plane)
		planes << plane
	end

	def empty?
		planes.empty?
	end

	def take_off(plane)
		planes.delete(plane)
	end

	def capacity
		@capacity = DEFAULT_CAPACITY
	end

	def full?
		plane_count >= capacity
	end

	def fill_with(planes)
		capacity.times {airport(plane)}
	end

	def plane_count
		planes.count
	end

end