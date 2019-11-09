# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'proxy_mate/version'

Gem::Specification.new do |spec|
  spec.name = 'proxy-mate'
  spec.version = ProxyMate::VERSION
  spec.authors = ['Helge Rausch']
  spec.email = ['helge@rausch.io']

  spec.summary =
    'Generates a PDF with standard size playing cards of your choice'
  spec.description = spec.summary
  spec.homepage = 'https://github.com/tsujigiri/proxy-mate/'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage

  spec.files = %w[
    bin/proxy-mate
    lib/proxy_mate.rb
    lib/proxy_mate/version.rb
  ]
  spec.bindir = 'bin'
  spec.executables = %w[proxy-mate]
  spec.require_paths = %w[lib]

  spec.add_dependency 'prawn', '~> 2.2.2'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rubocop'
end
