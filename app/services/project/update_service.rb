# frozen_string_literal: true

class Project
  # Exposes logic for updating projects.
  class UpdateService
    class Error < RuntimeError; end

    attr_reader :project, :params

    def initialize(options)
      @project = options[:project]
      @params = options[:params]
    end

    def run
      return ProjectSerializer.new(project).serializable_hash if project.update(params)

      raise Error, project.errors.full_messages.to_json
    end
  end
end
