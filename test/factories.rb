FactoryGirl.define do
  factory :medium do
    name 'Acrylics'
  end

  factory :artwork do
    image { File.new("#{Rails.root}/test/support/fixtures/artwork_image.jpg") }
  end
end
