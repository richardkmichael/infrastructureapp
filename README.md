Server Configuration
--------------------

Running passenger standalone from the app bundle
(`<cap_root>/shared/bundle`, not a gemset) requires `bundle exec
passenger start`.  We use a wrapper around `bundle`, but must edit to
change the working directory to the deployed app so that `bundle` will
find our `Gemfile`.

_Alternatives:_
* Use binstubs into `shared/bin`, and add it to `PATH`?
* Move the `cd` into the Upstart file
* Use an RVM one-off command: `rvm in /path/to/project do bundle exec passenger start`

`rvm wrapper ruby-1.9.3-p194\@infrastructureapp infrastructureapp bundle`
`deployer@ubuntu:~/.rvm/bin/infrastructureapp_bundle`

```
#!/usr/bin/env bash

if [[ -s "/home/deployer/.rvm/environments/ruby-1.9.3-p194@infrastructureapp" ]]
then
  source "/home/deployer/.rvm/environments/ruby-1.9.3-p194@infrastructureapp"
  cd "/home/deployer/apps/infrastructureapp/current"
  exec bundle "$@"
else
  echo "ERROR: Missing RVM environment file: '/home/deployer/.rvm/environments/ruby-1.9.3-p194@infrastructureapp'" >&2
  exit 1
fi
```
