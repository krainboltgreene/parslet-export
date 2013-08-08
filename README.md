parslet-export
--------------

  - [![Gem Version](https://badge.fury.io/rb/parslet-export.png)](https://rubygems.org/gems/parslet-export)
  - [![Code Climate](https://codeclimate.com/github/krainboltgreene/parslet-export.png)](https://codeclimate.com/github/krainboltgreene/parslet-export)
  - [![Build Status](https://travis-ci.org/krainboltgreene/parslet-export.png)](https://travis-ci.org/krainboltgreene/parslet-export)
  - [![Dependency Status](https://gemnasium.com/krainboltgreene/parslet-export.png)](https://gemnasium.com/krainboltgreene/parslet-export)
  - [![Coverage Status](https://coveralls.io/repos/krainboltgreene/parslet-export/badge.png?branch=master)](https://coveralls.io/r/krainboltgreene/parslet-export)


This gem lets you turn Parslet::Parsers into other things!

Currently we support:

  - Parslet::Parser -> Hash (for JSON or the like)


Using
=====

First lets create a parser:

``` ruby
class SomeParser < Parslet::Parser
  root(:command)
  rule(:space) { match["\s"].repeat }
  rule(:space?) { space.maybe }
  rule(:username) { match["a-zA-Z0-9"].repeat }
  rule(:password) { match["a-zA-Z0-9"].repeat }
  rule(:arguments) { username.as(:username) >> space? >> password.as(:password) >> space? }
  rule(:control) { str("account").as(:control) }
  rule(:action) { str("create").as(:action) }
  rule(:command) { control >> space >> action >> space >> arguments }
end
```

And now we dump it like this:

``` ruby
parser = SomeParser.new
hash = parser.to_hash
```

And we get this:

``` ruby
{"atom"=>"root",
 "parslet"=>
  {"atom"=>"entity",
   "name"=>:command,
   "parslet"=>
    {"atom"=>"sequence",
     "parslets"=>
      [{"atom"=>"entity",
        "name"=>:control,
        "parslet"=>
         {"atom"=>"named",
          "name"=>:control,
          "parslet"=>{"atom"=>"str", "str"=>"account"}}},
       {"atom"=>"entity",
        "name"=>:space,
        "parslet"=>
         {"atom"=>"repetition",
          "min"=>0,
          "max"=>nil,
          "parslet"=>{"atom"=>"re", "match"=>"[ ]", "re"=>/[ ]/m}}},
       {"atom"=>"entity",
        "name"=>:action,
        "parslet"=>
         {"atom"=>"named",
          "name"=>:action,
          "parslet"=>{"atom"=>"str", "str"=>"create"}}},
       {"atom"=>"entity",
        "name"=>:space,
        "parslet"=>
         {"atom"=>"repetition",
          "min"=>0,
          "max"=>nil,
          "parslet"=>{"atom"=>"re", "match"=>"[ ]", "re"=>/[ ]/m}}},
       {"atom"=>"entity",
        "name"=>:arguments,
        "parslet"=>
         {"atom"=>"sequence",
          "parslets"=>
           [{"atom"=>"named",
             "name"=>:username,
             "parslet"=>
              {"atom"=>"entity",
               "name"=>:username,
               "parslet"=>
                {"atom"=>"repetition",
                 "min"=>0,
                 "max"=>nil,
                 "parslet"=>
                  {"atom"=>"re",
                   "match"=>"[a-zA-Z0-9]",
                   "re"=>/[a-zA-Z0-9]/m}}}},
            {"atom"=>"entity",
             "name"=>:space?,
             "parslet"=>
              {"atom"=>"repetition",
               "min"=>0,
               "max"=>1,
               "parslet"=>
                {"atom"=>"entity",
                 "name"=>:space,
                 "parslet"=>
                  {"atom"=>"repetition",
                   "min"=>0,
                   "max"=>nil,
                   "parslet"=>{"atom"=>"re", "match"=>"[ ]", "re"=>/[ ]/m}}}}},
            {"atom"=>"named",
             "name"=>:password,
             "parslet"=>
              {"atom"=>"entity",
               "name"=>:password,
               "parslet"=>
                {"atom"=>"repetition",
                 "min"=>0,
                 "max"=>nil,
                 "parslet"=>
                  {"atom"=>"re",
                   "match"=>"[a-zA-Z0-9]",
                   "re"=>/[a-zA-Z0-9]/m}}}},
            {"atom"=>"entity",
             "name"=>:space?,
             "parslet"=>
              {"atom"=>"repetition",
               "min"=>0,
               "max"=>1,
               "parslet"=>
                {"atom"=>"entity",
                 "name"=>:space,
                 "parslet"=>
                  {"atom"=>"repetition",
                   "min"=>0,
                   "max"=>nil,
                   "parslet"=>
                    {"atom"=>"re", "match"=>"[ ]", "re"=>/[ ]/m}}}}}]}}]}}}
```

We can now load it like this:

``` ruby
parslet = Parslet::Parser.from_hash(hash)
```

And we can now parse with this:

``` ruby
parslet.parse("account create krainboltgreene 1234abcd")
```

Which gives this tree:

``` ruby
{:control=>"account"@0,
 :action=>"create"@8,
 :username=>"krainboltgreene"@15,
 :password=>"1234abcd"@31}
```


Installing
==========

Add this line to your application's Gemfile:

    gem 'parslet-export'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install parslet-export


Contributing
============

  1. Fork it
  2. Create your feature branch (`git checkout -b my-new-feature`)
  3. Commit your changes (`git commit -am 'Add some feature'`)
  4. Push to the branch (`git push origin my-new-feature`)
  5. Create new Pull Request
