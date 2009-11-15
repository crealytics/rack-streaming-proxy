require File.expand_path(
    File.join(File.dirname(__FILE__), %w[.. lib rack streaming_proxy]))

use Rack::Reloader, 1
# use Rack::CommonLogger # rackup already has commonlogger loaded
use Rack::Lint
use Rack::StreamingProxy do |req|
  "http://localhost:4000#{req.path}"
end

run lambda { |env| [200, {"Content-Type" => "text/plain"}, ""] }
