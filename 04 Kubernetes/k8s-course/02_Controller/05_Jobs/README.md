# <b>Jobs</b>
- It ensures that one or more pods execute their commands and exit successfully.
- When all the pods exited without errors, the job gets completed.
- When the jobs deleted, any created pods get deleted as well.

- <b>Jobs</b> creates <b>Pod</b> to complete the task.

- `apiVersion`: batch/v1
- `kind`: Job
- `name`: jobs
- `namespace`: true

<b>Remember: no short name</b>