# frozen_string_literal: true

require 'trinket_services_pb'

module Trinket
  class Server < Trinket::Gems::Service
    VERSION_PARTS = %i[major minor teeny patch].freeze

    def gem(request, _)
      specs = ::Gem::Specification.latest_specs.select do |spec|
        spec.name.match? Regexp.new request.name
      end

      Trinket::Response.new gems: gems(specs)
    end

    private

    def gems(specs)
      specs.map do |spec|
        segments = VERSION_PARTS.zip(spec.version.segments).to_h.compact
        version = Trinket::Version.new string: spec.version.to_s, **segments

        trinket_gem(spec, version)
      end
    end

    def trinket_gem(spec, version)
      Trinket::Gem.new(
        author_count: spec.authors.size,
        authors: spec.authors,
        description: spec.description.to_s,
        epoch_time: spec.date.to_i,
        homepage: spec.homepage.to_s,
        name: spec.name,
        summary: spec.summary.to_s,
        version: version
      )
    end
  end
end
