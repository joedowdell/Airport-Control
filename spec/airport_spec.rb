require 'airport'
require 'plane'
require 'weather'

# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport and how that is impermented.
#
# If the airport is full then no planes can land

describe Airport do
  let(:airport)         { Airport.new }
  let(:plane)           { Plane.new   }
  let(:stormy_airport)  { Airport.new }

  before (:each) do
    allow(airport).to receive(:random_weather).and_return("Sunny")
  end

  context 'taking off and landing' do
    it 'a plane can land' do
      airport.land(plane)
      expect(airport).not_to be_empty
    end
    
    it 'a plane can take off' do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport).to be_empty
    end
  end
  
  context 'traffic control' do
    
    let(:airport_full) {Airport.new(capacity: 6, planes:[:plane, :plane, :plane, :plane, :plane, :plane])}

    it 'a plane cannot land if the airport is full' do
      expect(airport_full).to be_full
      expect { airport_full.land plane }.to raise_error (RuntimeError)
    end
    
    # Include a weather condition using a module.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy, the plane can not take off and must remain in the airport.
    # 
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport
    context 'weather conditions' do


      it 'a plane cannot take off when there is a storm brewing' do
        allow(stormy_airport).to receive(:random_weather).and_return("Stormy")
        expect { stormy_airport.take_off plane }.to raise_error (RuntimeError)
      end
      
      it 'a plane cannot land in the middle of a storm' do
        allow(stormy_airport).to receive(:random_weather).and_return("Stormy")
        expect { stormy_airport.land plane }.to raise_error (RuntimeError)
      end

    end
  end
end



# grand final
# Given 6 planes, each plane must land. When the airport is full, every plane must take off again.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have the right status "landed"
# Once all the planes are in the air again, check that they have the status of flying!
xdescribe "The grand finale (last spec)" do
  it 'all planes can land and all planes can take off' do
    

  end
end

