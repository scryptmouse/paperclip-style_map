# Paperclip::StyleMap

[![Build Status](https://travis-ci.org/scryptmouse/paperclip-style_map.svg?branch=master)](https://travis-ci.org/scryptmouse/paperclip-style_map)

Access your paperclip attachment's styles' URLs with hash-like syntax.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'paperclip-style_map'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install paperclip-style_map

## Usage

Given a model named `Thing` with `has_attached_file :asset`

```ruby
thing = Thing.first

# Get a URL (expiring_url if s3)
thing.asset.style_map[:original]

# If you need a specific expiration from the default:
thing.asset.style_map.fetch :original, expiration: 5.hours

# Get all known styles as an indifferent hash
thing.asset.style_map.to_h
```

If using `delayed_paperclip` and the asset is processing, no URL will be returned. This behavior will be a configuration option in later versions.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/scryptmouse/paperclip-style_map. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Paperclip::StyleMap project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/scryptmouse/paperclip-style_map/blob/master/CODE_OF_CONDUCT.md).
