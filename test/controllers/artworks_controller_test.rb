require 'test_helper'

class ArtworksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @artwork = create(:artwork)
  end

  test 'index should list artworks' do
    create(:artwork, name: 'A walk in the woods')
    create(:artwork, name: 'Teatime')

    get artworks_url
    assert_response :success

    assert_includes(@response.body, 'A walk in the woods')
    assert_includes(@response.body, 'Teatime')
  end

  test 'should get new' do
    get new_artwork_url
    assert_response :success
  end

  test 'should create artwork' do
    assert_difference('Artwork.count') do
      post artworks_url,
           params: {
             artwork: {
               available: @artwork.available,
               name: @artwork.name,
               price: @artwork.price,
               image: fixture_file_upload(@artwork.image.path, 'image/jpeg')
             }
           }
    end

    assert_redirected_to artwork_url(Artwork.last)
  end

  test 'should show artwork' do
    @artwork.update_attribute(:name, 'Garfield')

    get artwork_url(@artwork)

    assert_response :success
    assert_includes(@response.body, 'Garfield')
  end

  test 'should get edit' do
    get edit_artwork_url(@artwork)
    assert_response :success
  end

  test 'should update artwork' do
    patch artwork_url(@artwork), params: { artwork: { available: @artwork.available, name: @artwork.name, price: @artwork.price } }
    assert_redirected_to artwork_url(@artwork)
  end

  test 'should destroy artwork' do
    assert_difference('Artwork.count', -1) do
      delete artwork_url(@artwork)
    end

    assert_redirected_to artworks_url
  end
end
