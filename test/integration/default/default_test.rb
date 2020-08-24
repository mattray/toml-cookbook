# InSpec test for recipe toml::default

# echo = "foxtrot"
# golf = "hotel"
# kilo = ["lima", "mike", "november"]
# [alpha]
# bravo = 10
# charlie = "delta"
# october = "pegasus"
# [india]
# juliett = true
describe file '/tmp/kitchen/cache/test1.toml' do
  it { should exist }
  its('group') { should eq 'vagrant' }
  its('owner') { should eq 'vagrant' }
  its('mode') { should cmp '0640' }
  its('content') { should match /^echo = \"foxtrot\"$/ }
  its('content') { should match /^golf = \"hotel\"$/ }
  its('content') { should match /^kilo = \[\"lima\", \"mike\", \"november\"\]$/ }
  its('content') { should match /^\[alpha\]$/ }
  its('content') { should match /^bravo = 10$/ }
  its('content') { should match /^charlie = \"delta\"$/ }
  its('content') { should match /^\[india\]$/ }
  its('content') { should match /^juliett = true$/ }
  its('content') { should match /^echo = \"foxtrot\"\ngolf = \"hotel\"\nkilo = \["lima", "mike", "november"\]\n\[alpha\]\nbravo = 10\ncharlie = \"delta\"\noctober = \"pegasus"\n\[india\]\njuliett = true$/ }
end

# echo = "foxtrot"
# golf = "hotel"
# kilo = ["lima", "mike", "november" ]
# [alpha]
# bravo = 10
# charlie = "delta"
# [india]
# juliett = true
# oscar = 14
describe file '/tmp/kitchen/cache/test2.toml' do
  it { should exist }
  its('group') { should eq 'vagrant' }
  its('owner') { should eq 'vagrant' }
  its('mode') { should cmp '0644' }
  its('content') { should match /^echo = \"foxtrot\"$/ }
  its('content') { should match /^golf = \"hotel\"$/ }
  its('content') { should match /^kilo = \[\"lima\", \"mike\", \"november\"\]$/ }
  its('content') { should match /^\[alpha\]$/ }
  its('content') { should match /^bravo = 10$/ }
  its('content') { should match /^charlie = \"delta\"$/ }
  its('content') { should match /^\[india\]$/ }
  its('content') { should match /^juliett = true$/ }
  its('content') { should match /^echo = \"foxtrot\"\ngolf = \"hotel\"\nkilo = \["lima", "mike", "november"\]\n\[alpha\]\nbravo = 10\ncharlie = \"delta\"\noctober = \"pegasus"\n\[india\]\njuliett = true$/ }
end

# eleven.twelve = 1112
# four.five.six = "456"
# one.two.three = "123"
# [nine.ten]
# clams = "oysters"
# juliett = "value"
# meyer = "14"
# oscar = 14
# [seven.eight]
# clams = "oysters"
# juliett = "value"
# oscar = 14
describe file '/tmp/kitchen/cache/test3.toml' do
  it { should exist }
  its('group') { should eq 'vagrant' }
  its('owner') { should eq 'vagrant' }
  its('mode') { should cmp '0640' }
  its('content') { should match /^eleven.twelve = 1112$/ }
  its('content') { should match /^four.five.six = \"456\"$/ }
  its('content') { should match /^one.two.three = \"123\"$/ }
  its('content') { should match /^\[nine\.ten\]$/ }
  its('content') { should match /^clams = \"oysters\"$/ }
  its('content') { should match /^juliett = \"value\"$/ }
  its('content') { should match /^meyer = \"14\"$/ }
  its('content') { should match /^oscar = 14$/ }
  its('content') { should match /^\[seven\.eight\]$/ }
  its('content') { should match /^clams = \"oysters\"$/ }
  its('content') { should match /^juliett = \"value\"$/ }
  its('content') { should match /^oscar = 14$/ }
end

describe file '/tmp/kitchen/cache/testX.toml' do
  it { should_not exist }
end
