# rFlickr

[![Project Status: Inactive - The project has reached a stable, usable state but is no longer being actively developed; support/maintenance will be provided as time allows.](http://www.repostatus.org/badges/latest/inactive.svg)](http://www.repostatus.org/#inactive)

**Note**: This gem has only been tested on Ruby 2.0 (but should work with 1.9).

Before you start using this gem you'll need a Flickr API key from [https://www.flickr.com/services/api/misc.api_keys.html](https://www.flickr.com/services/api/misc.api_keys.html).

## Using the Gem

Add:

    gem 'digitalpardoe-rflickr', '~> 2.0.0'

In your Gemfile then using the gem should be as simple as:

    require 'flickr'

After requiring the gem create an instance of it using your API details (instructions on how to get an auth token (optional) for authenticated requests below):

    flickr = Flickr.new( API_KEY, SHARED_SECRET, AUTH_TOKEN )

The gem will automatically construct queries to the Flickr API (returning JSON results) from method names, similar to the way ActiveRecord finders work, for example, to make an authenticated query to get all the members of a group you could call:

    flickr.flickr_groups_members_getList( args: { group_id: @group_id, membertypes: [2] }, auth: true )

No checking happens before the request is sent so ensure you've checked the [Flickr API](https://www.flickr.com/services/api/) for the required parameters if you run in to problems.

If the Flickr method requires a `POST` you can pass `get: false` in the method hash.

## Getting an Auth Token

First you'll need an IRB console with rFlickr available so you can `require 'flickr'` then perform the following steps:

    >> flickr = Flickr.new(API_KEY, SHARED_SECRET)
    >> flickr.api.login_link
    
Navigate to the URL provided and authorise the application.

    >> flickr.api.get_token
    
Store the token received in the response, this is your auth token, you can either use it when you initialise a `Flickr` object or add it at a later point using `flickr.auth_token(AUTH_TOKEN)`.
