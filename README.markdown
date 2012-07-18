# GoPollGo API Wrapper

This is a simple Ruby wrapper to the GoPollGo API to make creating a poll super simple.

## Usage

Using the wrapper and creating a poll with your app takes only a few seconds.

    require 'rubygems'
    require 'gopollgo'

    # Start a new client.
    client = GoPollGo::Client.new(YOUR_API_KEY)

    # Create a poll.  The returned value is a Hash
    # {
    #   "id" : "what-is-your-favorite-color",
    #   "embed_code" : "<a href=\"http://gopollgo.com/what-is-your-favorite-color-3\" id=\"what-is-your-favorite-color-3-placeholder\">View poll on GoPollGo</a><script>var GPG = window.GPG = window.GPG || {};GPG.slug=\"what-is-your-favorite-color-3\";GPG.path=\"http://localhost:3000\";(function() {var gs = document.createElement(\"script\");gs.type = \"text/javascript\";gs.src = \"http://c221023.r23.cf1.rackcdn.com/gpg_widget-89ae8ef8d8f611b350471738c71c81ca.js\";gs.defer = true;var s = document.getElementsByTagName('script')[0];s.parentNode.insertBefore(gs, s);})();</script>" 
    # }
    poll = client.create_poll({
      :question => "What is your favorite color?",
      :options  => ["Blue", "White", "Orange", "Green"]
    })


## Copyright

Copyright (c) 2012 Go Poll Go, Inc.
