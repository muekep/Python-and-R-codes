import numpy as np
import pandas as pd
import random
Gender = ["Male","Female"]
def generate_gender():
    return random.choice(Gender)
def create_worker(Worker_id, Name,Department, Salary, Gender,Employee_Level):
    return{
        "Worker_id":Worker_id,
        "Name":Name,
        "Department":Department,
        "Salary":Salary,
        "Gender":Gender,
        "Employee_Level":Employee_Level
    }
workers=[]
for i in range(450):
    worker=create_worker(
    Worker_id=i+1,
    Name= f"worker{i+1}",
    Department=f"Department{i%5+1}",
    Salary=3000+(i*100),
    Gender=generate_gender(),
    Employee_Level="0"
    )
    workers.append(worker)

print(workers[0])

print(f"Total Workers: {len(workers)}")
for worker in workers:
    if worker["Salary"] in range(10000,20001):
        worker["Employee_Level"] ="A5"
    elif worker["Salary"] in range(7500,30001) and worker["Gender"]=="Female":
        worker["Employee_Level"]="A5-F"
    print(worker)