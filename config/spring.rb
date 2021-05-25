Spring.watch(
  ".ruby-version",
  ".rbenv-vars",
  "tmp/restart.txt",
  "tmp/caching-dev.txt"
)

# config/spring.rb

%w(
  ...
  config/application.yml
).each { |path| Spring.watch(path) }
