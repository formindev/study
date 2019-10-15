module Inatra
  class << self
    @@routes = {}

    def routes(&block)
      instance_eval(&block)
    end

    def add_route(verb, path, &handler)
      @@routes[verb] ||= {}
      @@routes[verb][path] = handler
    end

    def get(path, &handler)
      add_route("GET", path, &handler)
    end

    def post(path, &handler)
      add_route("POST", path, &handler)
    end

    def put(path, &handler)
      add_route("PUT", path, &handler)
    end

    def patch(path, &handler)
      add_route("PATCH", path, &handler)
    end

    def delete(path, &handler)
      add_route("DELETE", path, &handler)
    end

    def head(path, &handler)
      add_route("HEAD", path, &handler)
    end

    def call(env)
      @request = Rack::Request.new(env)
      verb = @request.request_method
      requested_path = @request.path_info
      handler = @@routes[verb][requested_path]
      handler.call
    end
  end
end
