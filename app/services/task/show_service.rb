# frozen_string_literal: true

class Task
  # Exposes preparation (here mostly serializing) for showing particular task.
  class ShowService
    attr_reader :task

    def initialize(options)
      @task = options[:task]
    end

    def run
      TaskSerializer.new(task).serializable_hash
    end
  end
end
