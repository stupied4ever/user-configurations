This gem will help you if you need to store and read user configurations on
environments, global or local files.

## Installation

Add this line to your application's Gemfile:

    gem 'user-configurations'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install user-configurations

## Usage

### Precedence

ENV > local > global

### Writing

```ruby
configs = UserConfigurations::Configuration.new('project')
configs.store(user_name: 'stupied4ever')
```

Will store on a local file placed on ```~/.project``` a [YAML][yaml] file
with ```user_name```.

### Reading

```ruby
configs = UserConfigurations::Configuration.new('project')
configs['user_name'] # 'stupied4ever'
```

If you had a global file (```/etc/project```) with the ```user_name```
configurations, or an ```ENV``` var it would be readable too, just pay
attention on precendences.

## Contributing

1. Fork it ( https://github.com/stupie4ever/user-configurations/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

[yaml]: https://en.wikipedia.org/wiki/YAML
