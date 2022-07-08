# frozen_string_literal: true

class Project
  # Exposes logic for creating projects.
  class CreateService
    class Error < RuntimeError; end

    attr_reader :organization, :params

    def initialize(options)
      @organization = options[:organization]
      @params = options[:params]
    end

    def run
      project = organization.projects.build(params)

      return ProjectSerializer.new(project).serializable_hash if project.save

      raise Error, project.errors.full_messages.to_json
    end
  end
end
