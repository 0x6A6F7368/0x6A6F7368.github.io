# -*- encoding: utf-8 -*-
# stub: faraday-net_http 2.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "faraday-net_http".freeze
  s.version = "2.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/lostisland/faraday-net_http/releases/tag/v2.0.3", "homepage_uri" => "https://github.com/lostisland/faraday-net_http", "source_code_uri" => "https://github.com/lostisland/faraday-net_http" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jan van der Pas".freeze]
  s.date = "2022-05-17"
  s.description = "Faraday adapter for Net::HTTP".freeze
  s.email = ["janvanderpas@gmail.com".freeze]
  s.homepage = "https://github.com/lostisland/faraday-net_http".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.4.0".freeze)
  s.rubygems_version = "3.4.10".freeze
  s.summary = "Faraday adapter for Net::HTTP".freeze

  s.installed_by_version = "3.4.10" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_development_dependency(%q<faraday>.freeze, [">= 1.0"])
end