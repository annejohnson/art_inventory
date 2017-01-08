require 'test_helper'

class ArtworkTest < ActiveSupport::TestCase
  test 'should validate against negative prices' do
    @artwork = build(:artwork, price: -5)
    assert_not(@artwork.valid?)

    @artwork.price = nil
    assert(@artwork.valid?)

    @artwork.price = 0
    assert(@artwork.valid?)

    @artwork.price = 24.75
    assert(@artwork.valid?)
  end
end
