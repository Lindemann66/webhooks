# frozen_string_literal: true

class Task
  # Exposes logic for creating tasks.
  class CreateService
    class Error < RuntimeError; end

    attr_reader :project, :params

    def initialize(options)
      @project = options[:project]
      @params = options[:params]
    end

    def run
      task = project.tasks.build(params)

      return TaskSerializer.new(task).serializable_hash if task.save

      raise Error, task.errors.full_messages.to_json
    end
  end
end
