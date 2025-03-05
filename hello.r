generate_gender <- function() {
  Gender <- c("Male", "Female")
  sample(Gender, 1)
}

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

workers <- list()
tryCatch({
  for (i in 1:450) {
    tryCatch({
      worker <- create_worker(
        Worker_id = i,
        Name = paste0("worker", i),
        Department = paste0("Department", (i %% 5) + 1),
        Salary = 3000 + ((i - 1) * 100),
        Gender = generate_gender(),
        Employee_Level = "0"
      )
      workers[[i]] <- worker
    }, error = function(inner_e) {
      print(paste("Error creating worker", i, ":", inner_e$message))
    })
  }

  print(workers[[1]])
  print(paste("Total Workers:", length(workers)))

  for (i in 1:length(workers)) {
    tryCatch({
      salary <- workers[[i]]$Salary
      gender <- workers[[i]]$Gender

      if (salary >= 10000 && salary <= 20000) {
        workers[[i]]$Employee_Level <- "A5"
      } else if (salary >= 7500 && salary <= 30000 && gender == "Female") {
        workers[[i]]$Employee_Level <- "A5-F"
      }
      print(workers[[i]])
    }, error = function(loop_e) {
      print(paste("Error processing worker", workers[[i]]$Worker_id, ":", loop_e$message))
    })
  }
}, error = function(outer_e) {
  print(paste("An unexpected error occurred:", outer_e$message))
})
