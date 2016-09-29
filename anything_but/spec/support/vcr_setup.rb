VCR.configure do |c|
 c.cassette_library_dir = 'spec/vcr/fixtures'
 c.ignore_localhost = true
 c.hook_into :webmock
end
