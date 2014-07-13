require_relative 'plane'

class Airport

	DEFAULT_CAPACITY = 25


	attr_reader :capacity

	def initialize(options= {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
	end

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
		plane_count >= DEFAULT_CAPACITY
	end

	def fill_with(plane)
		capacity.times {airport(planes)}
	end

	def plane_count
		planes.count
	end

	def landing_clearance(plane)
		land(plane) if landing_clear?
	end

	def landing_clear?
		!full?
	end



end