send_file
=========

File sending for Rack applications.

Usage
-----

Make sure your application implements two methods: `env` and `halt`,
where `env` returns a hash with the Rack environment and `halt` returns
an array response like `[status, headers, [body]]`.

The next example uses [Cuba][cuba]:

```ruby
require "cuba"
require "send_file"

Cuba.plugin(SendFile)

Cuba.define do
  on "foo" do
    send_file("foo.pdf")
  end
end
```

Attachments
-----------

For **attachments**, it's recommended to use the HTML5 [download][download] attribute.

```html
<a href="/foo" download>Download foo</a>
```

You can specify a filename too:

```html
<a href="/foo" download="bar.pdf">Download bar</a>
```

Installation
------------

```
$ gem install send_file
```

[cuba]: https://github.com/soveran/cuba
[download]: http://davidwalsh.name/download-attribute
