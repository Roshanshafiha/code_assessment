#!/bin/bash
#SBATCH --job-name=task_a
#SBATCH --output=task_a_%j.out
#SBATCH --error=task_a_%j.err
#SBATCH --ntasks=1
#SBATCH --time=00:02:00
#SBATCH --mem=1G

# Generate random numbers and save to a file
echo "Generating random numbers..."
for i in {1..10}; do echo $RANDOM; done > random_numbers.txt

