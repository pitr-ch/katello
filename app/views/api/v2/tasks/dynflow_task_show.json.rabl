object @task if @task

attributes :uuid, :action, :user_id, :username, :organization_id, :pending
attributes :input, :output, :humanized, :cli_example

glue (@task || @object).execution_plan do
  attributes :started_at, :ended_at, :state, :result, :progress
end
