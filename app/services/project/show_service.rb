# frozen_string_literal: true

class Project
  # Exposes preparation (serializing) for showing particular project.
  class ShowService
    attr_reader :project

    def initialize(options)
      @project = options[:project]
    end

    def run
      ProjectSerializer.new(project).serializable_hash
    end
  end
end
