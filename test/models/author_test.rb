require 'test_helper'

class AuthorTest < ActiveSupport::TestCase

  test "New authors must have a name" do
    jeb = Author.new
    refute jeb.save
    refute jeb.errors.blank?
    assert jeb.errors.messages.values.flatten.include?("can't be blank")

  end

end
