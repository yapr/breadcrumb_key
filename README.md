# BreadcrumbKey

BreadcrumbKey is a gem that provides a straightforward way to generate consistent and standardized breadcrumb keys for Rails applications. It's optimized for seamless integration with breadcrumb generation libraries, especially Gretel.


## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add breadcrumb_key

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install breadcrumb_key

## Usage

BreadcrumbKey works hand-in-hand with breadcrumb generation libraries, and while it's not exclusive to any particular library, it's optimized for a seamless experience with [Gretel](https://github.com/kzkn/gretel).

```erb
<%# app/views/items/show.html.erb %>
<% breadcrumb breadcrumb_key, @item.name, item_path(@item) %>
```

By using breadcrumb_key, you can automatically generate the appropriate breadcrumb key based on the controller and action name, reducing the potential for typos and inconsistency.

For a controller named items and an action named show, the breadcrumb_key would return items_show, which can be directly utilized with Gretel's breadcrumb definitions.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/yapr/breadcrumb_key.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
