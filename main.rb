load 'minutes.rb'

m = Minutes.new()

m.get_inputs()

if !m.has_inputs?
    puts "Please input proper formatted time and number of minutes. Run <ruby main.rb> again."
    return
end

puts m.new_time