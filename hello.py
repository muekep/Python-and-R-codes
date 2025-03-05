import numpy as np
import pandas as pd
import random

Gender = ["Male", "Female"]

def generate_gender():
    return random.choice(Gender)

def create_worker(Worker_id, Name, Department, Salary, Gender, Employee_Level):
    return {
        "Worker_id": Worker_id,
        "Name": Name,
        "Department": Department,
        "Salary": Salary,
        "Gender": Gender,
        "Employee_Level": Employee_Level
    }

workers = []
try:
    for i in range(450):
        try:
            worker = create_worker(
                Worker_id=i + 1,
                Name=f"worker{i + 1}",
                Department=f"Department{i % 5 + 1}",
                Salary=3000 + (i * 100),
                Gender=generate_gender(),
                Employee_Level="0"
            )
            workers.append(worker)
        except Exception as inner_e:
            print(f"Error creating worker {i + 1}: {inner_e}")

    print(workers[0])
    print(f"Total Workers: {len(workers)}")

    for worker in workers:
        try:
            salary = worker["Salary"]
            gender = worker["Gender"]
            if 10000 <= salary <= 20000:
                worker["Employee_Level"] = "A5"
            elif 7500 <= salary <= 30000 and gender == "Female":
                worker["Employee_Level"] = "A5-F"
            print(worker)
        except (KeyError, TypeError) as loop_e:
            print(f"Error processing worker {worker.get('Worker_id', 'Unknown')}: {loop_e}")

except Exception as outer_e:
    print(f"An unexpected error occurred: {outer_e}")
