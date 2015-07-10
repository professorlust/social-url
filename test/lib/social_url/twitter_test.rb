require 'test_helper'

module SocialUrl
  class TwitterTest < Minitest::Test
    def setup
      @options = {
        text: 'Hello World',
        url: 'http://example.com',
        hashtags: %w(nature sunset),
        via: 'twitterdev',
        related: ['twitter:Twitter News', 'twitterapi:Twitter API News']
      }
    end

    def test_url
      url = ['https://twitter.com/intent/tweet/?text=Hello%20World',
             '&url=http%3A%2F%2Fexample.com',
             '&hashtags=nature,sunset',
             '&via=twitterdev',
             '&related=twitter%3ATwitter%20News,twitterapi%3ATwitter%20API%20News'].join

      opts = SocialUrl.normalize(@options)
      assert_equal url, Twitter.new(opts).url
    end
  end
end
