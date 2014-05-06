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

### Reading

```ruby
configs = UserConfigurations::Configuration.new('project')
configs['user_name']
```

That will give to you the value of that configuration on a ENV variable, local,
or global variable (with that precedence).

### Writing

```ruby
configs = UserConfigurations::Configuration.new('project')
configs.store(user_name: 'stupied4ever')
```

Will store on a local file placed on ```~/.project``` a [YAML][yaml] file with
```user_name```.

## Contributing

1. Fork it ( https://github.com/stupie4ever/user-configurations/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

[yaml]: https://en.wikipedia.org/wiki/YAML
