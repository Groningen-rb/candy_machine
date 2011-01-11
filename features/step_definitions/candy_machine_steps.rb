begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end 
require 'cucumber/formatter/unicode'
$:.unshift(File.dirname(__FILE__) + '/../../lib')
require 'candy_machine'

Before do
  @candy_machine = CandyMachine.new
end

After do
end

Given /^I have inserted an? (.*) coin into the candy machine$/ do |amount|
  @candy_machine.insert_coin(amount)
end

When /^I take a look at the display$/ do
  @result = @candy_machine.read_display
end

Then /^the display should read '([\d.]+)'$/ do |value|
  @result.should == value
end

Then /^I should find (.*) in the change drawer$/ do |amount|
  amount.split(', ').each do |amount|
    @candy_machine.returns.should include(amount)
  end
end

When /^I press the abort button$/ do
  @candy_machine.push_abort_button
end

When /^I press (\d+)$/ do |number|
  @candy_machine.push_keypad_button(number)
end

Given /^there is nothing with the number (\d+)$/ do |arg1|
end
