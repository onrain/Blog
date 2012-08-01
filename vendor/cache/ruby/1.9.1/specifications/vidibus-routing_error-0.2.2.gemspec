# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "vidibus-routing_error"
  s.version = "0.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andre Pankratz"]
  s.date = "2012-02-07"
  s.description = "Catches ActionController::RoutingError and sends it to a custom method."
  s.email = "andre@vidibus.com"
  s.homepage = "https://github.com/vidibus/vidibus-routing_error"
  s.require_paths = ["lib"]
  s.rubyforge_project = "vidibus-routing_error"
  s.rubygems_version = "1.8.24"
  s.summary = "Catches ActionController::RoutingError in Rails 3"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rdoc>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, [">= 1.0.0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rdoc>, [">= 0"])
  end
end
