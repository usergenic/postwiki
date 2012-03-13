Transform /^Post "(.*)"$/ do |name|
  wiki.posts.find(:name => name)
end

Given /^a Post "(.*)"$/ do |name|
  wiki.posts.create(:name => name)
end

Given /^a Post "(.*)" with the following text$/ do |name, text|
  wiki.posts.create(:name => name, :text => text)
end

Given /^the following Links?$/ do |table|
  table.hashes.each do |link|
    link.each do |key, value|
      link[key] &&= wiki.posts.find_or_create(:name => value)
    end
    wiki.links.create(link)
  end
end

# FIXME: review whether this _redundant_ step definition (equivalent to the
# "Then x should have") is worth keeping in the context of feature design.
Given /^the (Post ".*") has (no|\d+) Links?$/ do |post, count|
  post.links.count.should == count.to_i
end

When /^I append the following text to the (Post ".*")$/ do |post, text|
  post.text = [post.text, text].compact.join("\n")
  post.save
end

When /^I change the text of the (Post ".*") to the following$/ do |post, text|
  post.text = text
  post.save
end

When /^I create a Post "(.*)" with the following text$/ do |post_name, text|
  wiki.posts.create :name => post_name, :text => text
end

Then /^the (Post ".*") should have (\d+) (?:History|Histories) with the following$/ do |post, count, table|
  histories = post.histories
  histories.count.should == count.to_i
  table.hashes.each do |row_hash|
    histories.should be_any do |history|
      row_hash.all? do |key, value|
        if value =~ %r{^/.+/$}
          history.send(key).should match(Regexp.new(value))
        else
          history.send(key).to_s.should == value.to_s
        end
      end
    end
  end
end

Then /^the (Post ".*") should have (no|\d+) Links?$/ do |post, count|
  post.links.count.should == count
end

# FIXME: this feels/looks ugly.  Perhaps a custom RSpec expectation to fix?
Then /^the (Post ".*") should have (no|\d+) Links? with the following$/ do |post, count, table|
  links = post.links
  links.count.should == count.to_i
  table.hashes.each do |row_hash|
    links.should be_any do |link|
      row_hash.all? do |key, value|
        link.send(key).should == value
      end
    end
  end
end
