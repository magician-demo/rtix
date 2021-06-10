class ApplicationJob < ActiveJob::Base
  around_perform { |_job, block| Bullet.profile { block.call } }
end
