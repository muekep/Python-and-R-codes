# Generate Gender Function
generate_gender <- function() {
  Gender <- c("Male", "Female")
  sample(Gender, 1)
}

# Create Worker Function
create_worker <- function(Worker_id, Name, Department, Salary, Gender, Employee_Level) {
  list(
    Worker_id = Worker_id,
    Name = Name,
    Department = Department,
    Salary = Salary,
    Gender = Gender,
    Employee_Level = Employee_Level
  )
}

# Generate Workers
workers <- list()
for (i in 1:450) {
  worker <- create_worker(
    Worker_id = i,
    Name = paste0("worker", i),
    Department = paste0("Department", (i %% 5) + 1),
    Salary = 3000 + ((i - 1) * 100),
    Gender = generate_gender(),
    Employee_Level = "0"
  )
  workers[[i]] <- worker
}

# Print First Worker
print(workers[[1]])

# Print Total Workers
print(paste("Total Workers:", length(workers)))

# Update Employee Levels
for (i in 1:length(workers)) {
  salary <- workers[[i]]$Salary
  gender <- workers[[i]]$Gender

  if (salary >= 10000 && salary <= 20000) {
    workers[[i]]$Employee_Level <- "A5"
  } else if (salary >= 7500 && salary <= 30000 && gender == "Female") {
    workers[[i]]$Employee_Level <- "A5-F"
  }
  print(workers[[i]])
}
