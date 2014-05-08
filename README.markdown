Rateable
========
Advanced Rating for Rails

## Installation

To use it, add it to your Gemfile:

    gem 'rateable', :git => 'git://github.com/m7moud/rateable.git'

### Post Installation

1. rails g rateable:install
2. rake db:migrate


## Usage

```ruby
    class Photo < ActiveRecord::Base
      rateable
    end

    @photo = Photo.new(:name => "Bobby")
    @photo.rate(:rating => 5, :user => current_user)
    @photo.rated?(current_user)
    @photo.users_rated(options)
    @photo.rating! #AVG
    @photo.ratings
    @photo.ratings.best_rated #order rating desc
    @photo.ratings.most_rated #order ratings_count desc
    @photo.rating_by_user(current_user)
```

## Credits


## License
Copyright (c) 2014 Mahmoud Said (http://m7moud.com/), released under the MIT license