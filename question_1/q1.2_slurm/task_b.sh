#!/bin/bash
#SBATCH --job-name=task_b
#SBATCH --output=task_b_%j.out
#SBATCH --error=task_b_%j.err
#SBATCH --ntasks=1
#SBATCH --time=00:02:00
#SBATCH --mem=1G

# Read numbers from the file and compute their sum
echo "Computing the sum of the numbers..."
sum=$(awk '{s+=$1} END {print s}' random_numbers.txt)
echo "The sum is: $sum"

