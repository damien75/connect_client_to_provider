FactoryGirl.define do
  factory :provider do
    company 'New Company'
    status 'public'
    specialty 'specialty 1'
    added_to_db_date Time.now
  end

end
