#!/bin/bash

# Submit Task A and get the job ID
job_id_a=$(sbatch task_a.sh | awk '{print $4}')
echo "Submitted Task A with Job ID: $job_id_a"

# Submit Task B with a dependency on the completion of Task A
job_id_b=$(sbatch --dependency=afterok:$job_id_a task_b.sh | awk '{print $4}')
echo "Submitted Task B with Job ID: $job_id_b, dependent on Task A"

# Function to check job status
check_job_status() {
    local job_id=$1
    squeue -j $job_id -h -o %T
}

# Monitor jobs until they are done
for job_id in $job_id_a $job_id_b; do
    while true; do
        status=$(check_job_status $job_id)
        if [[ $status == "COMPLETED" ]]; then
            echo "Job $job_id completed."
            break
        elif [[ $status == "FAILED" ]]; then
            echo "Job $job_id failed."
            exit 1
        else
            echo "Job $job_id is still running."
            sleep 10
        fi
    done
done

echo "All jobs completed successfully."

