FactoryGirl.define do
  factory :user do
    email 'test@example.com'
    password 'f4k3p455w0rd'

    # if needed
    # is_active true
  end

  factory :admin, class: User do
    email 'tester@example.com'
    password 'f4k3p455w0rdy0'
    admin      true
  end
end
