# frozen_string_literal: true

require "test_helper"

class SocialUrl::Networks::FacebookTest < Minitest::Test
  def setup
    @options = { url: "http://example.com" }
  end

  def test_url
    opts = SocialUrl.normalize(@options)
    url = "https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fexample.com"

    assert_equal url, SocialUrl::Networks::Facebook.new(opts).url
  end
end
