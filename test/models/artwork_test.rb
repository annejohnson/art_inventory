require 'test_helper'

class ArtworkTest < ActiveSupport::TestCase
  test 'should validate against blank images' do
    artwork = build(:artwork, image: nil)
    assert_not(artwork.valid?)
  end

  test 'should validate against negative prices' do
    artwork = build(:artwork, price: -5)
    assert_not(artwork.valid?)
  end

  test 'should allow nil prices' do
    artwork = build(:artwork, price: nil)
    assert(artwork.valid?)
  end

  test 'should allow a zero price' do
    artwork = build(:artwork, price: 0)
    assert(artwork.valid?)
  end

  test 'should allow positive prices' do
    artwork = build(:artwork, price: 24.75)
    assert(artwork.valid?)
  end

  test 'should set and get associated media' do
    artwork = create(:artwork, medium_list: ['Acrylics', 'Paint'])

    artwork.reload

    assert_includes(artwork.medium_list, 'Acrylics')
    assert_includes(artwork.medium_list, 'Paint')
  end
end
