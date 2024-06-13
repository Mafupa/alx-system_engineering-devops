# Increase request limit

# Append limit
exec{ 'increase-limit':
	command => 'sed -i "s/15/4096" /etc/default/nginx',
	path => '/usr/local/bin/:/bin/'
} ->

# Restart
exec{ 'restart':
	command => 'nginx restart',
	path => '/etc/init.d'
}
