FactoryGirl.define do
  factory :thing do
    asset { File.new(File.join(__dir__, 'support/fixtures/image.gif')) }

    trait :without_asset do
      asset nil
    end
  end
end
