# AppdevSupport

For Rails gems **only**.
Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/appdev_support`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'appdev_support', git: "https://github.com/firstdraft/appdev_support"
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install appdev_support

## Usage

Once installed, you can do things like:

```ruby
# in app/controllers/events_controller.rb
class EventsController < ApplicationController 
  def index
    cookies.store(:theme, "dark")
    cookies.fetch(:theme)
    session.fetch(:user_id)
  end
end
```

and `session.fetch` will raise a `KeyNotFound` Exception.

`.fetch` can be called on `session`, `cookies`, and any `ActiveRecord` object. For an `ActiveRecord` object, you can `.fetch` a column.

```ruby
Event.fetch(:starts_on) # => "Mon, 23 Mar 2020 23:25:48"
```

Similarly, `.store` can be called on `session` and `cookies` with the expected behavior. 

```ruby
session.store(:user_id, 1)
```

Displaying an `ActiveRecord:Relation` in a View file will display:

```html
ActiveRecord:Relation:Event (array with 4 Event instances inside)
```

You can call `.at` on an `ActiveRecord:Relation` instead of just `[]` to mirror how Arrays work.

```ruby
Events.all.at(0)
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/appdev_support. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/appdev_support/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the AppdevSupport project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/appdev_support/blob/master/CODE_OF_CONDUCT.md).
