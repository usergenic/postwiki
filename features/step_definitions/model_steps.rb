Transform /^Post "(.*)"/ do |post_name|
  Post.find_by_name(post_name)
end

Given /^a Post "(.*)"$/ do |post_name|
  Postwiki::Post.create :name => post_name
end

Given /^the following Post Links?$/ do |table|
  table.hashes.each do |post_link_hash|
    PostLink.create(post_link_hash)
  end
end

# TODO: review whether this is meaningful in the context of feature design.
Given /^the (Post ".*") has (no|\d+) Post Links?$/ do |post, count|
  post.link_count.should == count.to_i
end

When /^I append the following text to the (Post ".*")$/ do |post, text|
  post.body = [post.body, text].compact.join("\n")
  post.save
end

When /^I change the text of the (Post ".*") to the following$/ do |post, text|
  post.body = text
  post.save
end

Then /^the (Post ".*") should have (no|\d+) Post Links?$/ do |post, count|
  post.link_count.should == count
end

Then /^the Post "(.*)" should have (no|\d+) Post Links? with the following$/ do |post_name, count, table|
  puts table.hashes.inspect
end
