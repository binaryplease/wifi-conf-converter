
#!/usr/bin/env ruby

file = File.new("../wpa_supplicant.conf" , "r")


class Wifinet
	attr_accessor :ssid, :pass

	def valid?
		return (!@pass.nil? && !@ssid.nil?)
	end

	def print
		puts "#{@ssid[/".*"/,0]}:#{@pass[/".*"/,0]}"
	end
end

while (line = file.gets) do

	if line =~ /^network=/
		w = Wifinet.new
	end

	if line =~ /^\s*ssid/
		w.ssid=line
	end

	if line =~ /^\s*psk/
		w.pass=line
	end

	if line =~ /^}/
		w.print if w.valid?
	end

end

file.close
