# -*- encoding: utf-8 -*-
# stub: jqvmap-rails 2.1.2.2 ruby lib

Gem::Specification.new do |s|
  s.name = "jqvmap-rails"
  s.version = "2.1.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Manifest Interactive", "Adrian Rangel"]
  s.date = "2014-02-23"
  s.description = "JQVMap is a jQuery plugin that renders Vector Maps.  It uses resizable Scalable Vector Graphics (SVG) for modern browsers like Firefox, Safari, Chrome, Opera and Internet Explorer 9.  Legacy support for older versions of Internet Explorer 6-8 is provided via VML"
  s.email = ["adrian.rangel@gmail.com"]
  s.homepage = "http://jqvmap.com/"
  s.licenses = ["MIT"]
  s.rubyforge_project = "jqvmap-rails"
  s.rubygems_version = "2.2.2"
  s.summary = "JQVMap is a jQuery plugin that renders Vector Maps.  It uses resizable Scalable Vector Graphics (SVG) for modern browsers like Firefox, Safari, Chrome, Opera and Internet Explorer 9.  Legacy support for older versions of Internet Explorer 6-8 is provided via VML"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jquery-rails>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<jquery-rails>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<jquery-rails>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
