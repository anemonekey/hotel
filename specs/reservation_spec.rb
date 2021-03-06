require_relative 'spec_helper'

describe 'Reservation' do
  before do
    @checkin = Date.new(2017, 10, 31)
    @checkout = Date.new(2017, 11, 4)
    @reservation = Hotels::Reservation.new(@checkin, @checkout)
  end # ------------------------- before block

  describe '#initialize' do
    it 'Can be initialized' do
      @reservation.must_be_instance_of Hotels::Reservation
    end
    it 'Has an ID' do
      @reservation.id.must_be_kind_of Integer
    end
    it 'Must contain at least one Date' do
      @reservation.dates.length.must_be :>=, 1
      @reservation.dates[0].must_be_instance_of Date
    end
    it 'Creates a new Reservation with a single date parameter' do
      Hotels::Reservation.new(@checkin).must_be_kind_of Hotels::Reservation
    end
  end # ------------------------- describe #initialize block

  describe '#calc_total' do
    it 'Returns an Integer' do
      @reservation.total_cost.must_be_kind_of Integer
    end
    it 'Returns the correct value for a given Reservation' do
      assert_equal 800, @reservation.total_cost
    end
  end # ------------------------- describe #calc_total block
end
