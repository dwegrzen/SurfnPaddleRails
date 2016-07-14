require 'test_helper'

class PostTest < ActiveSupport::TestCase

  test "Post can belong to an Author using .posts" do
    author = Author.new(name: "Jack Daniels")
    newpost1 = Post.new(body: "Text here.")
    newpost2 = Post.new(body: "More text here.")
    author.posts << newpost1
    author.posts << newpost2
    assert author.posts.length == 2
    assert newpost2.author.name == "Jack Daniels"
  end

  test "New posts must contain some body text" do
    newpost = Post.new
    refute newpost.save
    refute newpost.errors.blank?
    newpost.errors.messages.values.flatten.include?("can't be blank")
  end

end
