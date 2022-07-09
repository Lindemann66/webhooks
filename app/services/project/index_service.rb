# frozen_string_literal: true

class Project
  # Exposes preparation (here mostly serializing) for showing all projects of organization.
  class IndexService
    attr_reader :organization

    def initialize(options)
      @organization = options[:organization]
    end

    def run
      ProjectSerializer.new(organization.projects).serializable_hash
    end
  end
end
