# Rspec::Git

Creates a git commit after each TDD step. Uses the new specification name to build the commit message. Built to the Ruby based RSpec.

## Installation

    $ gem install rspec-git

## Usage

Extend the spec file with the requirement:

    describe "User" do
      it "should contain name" do
        User.new.should respond_to(:name)
      end
    end

After implementing the feature and all of your specs are green, just call the <code>rspec-git</code> command in your project's root directory:

    $ rspec-git

It added the new changes to stage and created a git commit with the following message:

    Added user should contain name

If you remove the spec, the generated message will be the following:

    Removed user should contain name

Let me know if you have any issue!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
