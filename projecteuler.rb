array = (1..999).to_a
array.select! { |i| i % 3 == 0 || i % 5 == 0 }
puts array.inject(:+)