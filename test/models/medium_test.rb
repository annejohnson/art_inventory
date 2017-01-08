require 'test_helper'

class MediumTest < ActiveSupport::TestCase
  test 'should validate against duplicates by name' do
    medium = create(:medium)
    duplicate = build(:medium, name: medium.name)
    assert_not(duplicate.valid?)
  end

  test 'should validate against blank names' do
    medium = build(:medium, name: ' ')
    assert_not(medium.valid?)
  end

  test 'should format names to remove extra spaces' do
    medium = create(:medium, name: '   Mixed  media  ')
    assert_equal(medium.name, 'Mixed media')
  end
end
