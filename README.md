### TLDR

Start Hanami server, navigate to root to get started.

Pay attention in logs to object IDs for better_errors middleware object.

### The Problem

No matter what, the root page won't work for better_errors, because the `env['SCRIPT_NAME']` is set to `'/'`.

It will work for other pages though. To test, go to `/error` to see better_errors in action.

If you start the server with the `--no-code-reloading` flag, then better_errors will operate correctly.

If you start the server normally (`hanami server`), then better_errors won't load the right hand side of its custom error page.

NOTE: This demo bundles better_errors from [phoffer/better_errors](https://github.com/phoffer/better_errors).

The only change from charliesome/better_errors is to print out the middleware's object_id for debugging.


### The cause

The problem is that every request has a new instance of the better_errors middleware object.

This is true when the middleware is mounted as an Application Middleware, regardless of whether code reloading is enabled.

For global middleware, this is true if code reloading is enabled. If disabled, then better_errors works correctly.


This app loads better_errors globally in config.ru.

It has the application middleware code in place but commented out, for quick checking.



### Extra

This repo includes a sinatra app, and everything required was included in the Gemfile.

To run, just `bundle exec ruby sinatra.rb`
