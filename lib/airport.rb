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

	def airport_error_handler(plane)
		raise "error: airport is full" if full?
		
	end

	def full?
		plane_count >= DEFAULT_CAPACITY
	end

	def fill_with(plane)
		capacity.times {airport(planes)}
	end

	def plane_count
		planes.count
	end

end