require 'trinket_services_pb'

class Trinket::Server < Trinket::Gem::Service
  def gem request, _
    matching_gems = Gem::Specification.latest_specs.select do |spec|
      spec.name.match? Regexp.new request.name
    end.map do |spec|
      segments = %i[major minor teeny patch].zip(spec.version.segments).select { |_, v| v }.to_h
      version = Trinket::Version.new string: spec.version.to_s, **segments

      Trinket::Gems.new(
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

    Trinket::Response.new gems: matching_gems
  end
end
