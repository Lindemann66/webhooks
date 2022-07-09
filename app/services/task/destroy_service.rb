# frozen_string_literal: true

class Task
  # Exposes logic for destroying tasks.
  class DestroyService
    attr_reader :task

    def initialize(options)
      @task = options[:task]
    end

    def run
      task.destroy
    end
  end
end
