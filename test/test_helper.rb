dir = File.expand_path('../lib', __dir__)
$:.unshift(dir) unless $:.include?(dir)

require 'bundler'
Bundler.require(:test)

def context(*args, &block)
  describe(*args, &block)
end





