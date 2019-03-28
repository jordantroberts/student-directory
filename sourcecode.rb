#Write a short program that reads its own source code
#(search StackOverflow to find out how to get the name of the currently executed file)
#and prints it on the screen.



def sourcecode
  file = File.open($0, "r") do |file|
    file.readlines.each do |line|
      print file
    end
  end
end

sourcecode

# £0 Contains the name of the script being executed. May be assignable.
