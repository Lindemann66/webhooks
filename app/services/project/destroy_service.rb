# frozen_string_literal: true

class Project
  # Exposes logic for destroying projects.
  class DestroyService
    attr_reader :project

    def initialize(options)
      @project = options[:project]
    end

    def run
      project.destroy
    end
  end
end
