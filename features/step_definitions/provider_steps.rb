Given /^the following providers exist:$/  do |providers_table|
  providers_table.hashes.each do |provider|
      Provider.create!(provider)
  end
end
