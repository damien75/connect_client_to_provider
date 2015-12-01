FactoryGirl.define do
  factory :provider do
    name 'New Company'
    status 'public'
    specialty 'specialty 1'
    added_to_db_date Time.now
  end

end
