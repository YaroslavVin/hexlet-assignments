# frozen_string_literal: true

10.times do |i|
  puts "start generating task #{i}"
  random_status = ['new', 'in_progress', 'done'].sample
  status = Status.create(name: random_status)
  task = Task.create(name: "task name #{i}", status: status, description: "task description#{i}")
  another_task = Task.create(name: "another_task #{i}", status: status, description: "another_task#{i}")
  User.create(name: "New name#{i}", tasks: [task])
  puts "finished generating task #{i}"
end