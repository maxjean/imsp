module Transfer
require 'net/scp'
	def self.upload(host,username,password,local_path,remote_path)
		options = {recursive: true}
		Net::SCP.start(host, username, :password => password) do |scp|
			scp.upload!(local_path, remote_path, options)
			channel = scp.upload(local_path, remote_path, options)
				channel.wait
		end
	end
end
