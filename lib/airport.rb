require_relative 'plane'
require_relative 'weather'

class Airport

	include Weather
	attr_reader :capacity

	DEFAULT_CAPACITY = 6

def initialize(options= {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@planes = options.fetch(:planes, [])
	end

	def planes
		@planes ||= []
	end

	def land(plane)
		raise "Sorry, the airport is full!" if full?
		raise "Stormy weather plane take off delayed" if random_weather == "Stormy"
		planes << plane
	end

	def empty?
		planes.empty?
	end

	def take_off(plane)
		raise "Storm coming can't land plane!" if random_weather == "Stormy"
		planes.delete(plane)
	end

	def capacity
		@capacity = DEFAULT_CAPACITY
	end

	def full?
		plane_count == capacity
	end

	def fill_with(plane)
		capacity.times {airport(planes)}
	end

	def plane_count
		@planes.count
	end

	def landing_clearance(plane)
		land(plane) if landing_clear?
	end

	def landing_clear?
		!full?
	end


end