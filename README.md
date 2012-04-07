# Backrack

Backrack generates a Backbone.js powered mobile app structure for you. Harnessing the power of Sprockets for asset packaging and a Rack server for on the fly asset generation to make development a breeze.

## Installation

    $ gem install backrack

## Usage

Generate your application:

	backrack new my_app

Run your server for development (I suggest Pow if you're on OSX)

	cd my_app; unicorn

To see the generators that will build your files for you:

	backrack generate
	
## Examples

	backrack generate view users/new
	backrack generate model user
	backrack generate collection users --model user --url http://mysite/api/users

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License
See LICENSE file.
