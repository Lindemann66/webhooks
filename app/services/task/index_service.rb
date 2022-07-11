# frozen_string_literal: true

class Task
  # Exposes preparation (here mostly serializing) for showing all tasks of project.
  class IndexService
    attr_reader :project

    def initialize(options)
      @project = options[:project]
    end

    def run
      TaskSerializer.new(project.tasks).serializable_hash
    end
  end
end
