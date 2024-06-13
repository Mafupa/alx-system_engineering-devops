# Increase request limit

# Append limit
exec{ 'increase-limit':
	provider => shell,
	command  => 'sudo sed -i "s/ULIMIT=\"-n 15\"/ULIMIT=\"-n 4096\"/" /etc/default/nginx',
	before   => Exec['restart'],
}

# Restart
exec{ 'restart':
	provider => shell,
	command => 'nginx restart',
}
