  server   '127.0.0.1',
    user:  'visainfo',
    roles: %w{app db web},
    ssh_options: {
      keys: [
        # for ec2
        File.expand_path('~/.ssh/visainfo'),
        # for github
        File.expand_path('~/.ssh/id_rsa')
      ],
      forward_agent: true,
      auth_methods: %w(publickey)
    }