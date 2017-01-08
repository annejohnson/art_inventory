require 'test_helper'

class MediaControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get media_url
    assert_response :success
  end

  test 'should get show' do
    artwork = create(:artwork, medium_list: 'watercolor, pencil')
    medium = artwork.media.find_by!(name: 'watercolor')

    get medium_url(medium)
    assert_response :success
  end
end
