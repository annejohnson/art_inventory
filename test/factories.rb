FactoryGirl.define do
  factory :artwork do
    image { File.new("#{Rails.root}/test/support/fixtures/artwork_image.jpg") }
  end
end
