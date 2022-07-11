# frozen_string_literal: true

class Task
  # Exposes logic for updating tasks.
  class UpdateService
    class Error < RuntimeError; end

    attr_reader :task, :params

    def initialize(options)
      @task = options[:task]
      @params = options[:params]
    end

    def run
      return TaskSerializer.new(task).serializable_hash if task.update(params)

      raise Error, task.errors.full_messages.to_json
    end
  end
end
