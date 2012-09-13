# Geditor
This gem distills from gblog, my old light weight blog. it includes light weight texteditor, textile like syntax and code syntax highlight.

# Installation

Add this line to your application's Gemfile:

    gem 'geditor'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install geditor

## Usage

in view for generating text:
<%= use_geditor %>
<%= f.text_area :content, :id => "geditor", :class => 'text_area' %>

in view for display text:
<%= g_format content %>

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request