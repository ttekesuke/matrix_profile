require "./lib/matrix_profile"

matrix_profile = MatrixProfile.new
data = [0,1,3,2,9,1,14,15,1,2,2,10,7]
window_size = 4
profile, indices = matrix_profile.result(data, window_size)
p profile
p indices

# repeated_patterns = matrix_profile.find_repeated_patterns(profile, indices, 12, 4)
# puts "Repeated patterns:"
# repeated_patterns.each do |pattern|
#   puts "Start: #{pattern[0]}, End: #{pattern[1]}"
# end
