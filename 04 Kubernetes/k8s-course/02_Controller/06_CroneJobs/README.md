# <b>CroneJobs</b>
- It creates job on a repeating schedule.
- CronJob object is like one line of a crontab (cron table) file. It runs a job periodically on a given schedule, written in Cron format.


- <b>CronJob</b> creates <b>Jobs</b>, <b>Jobs</b> creates <b>Pod</b> to complete the task.

- `apiVersion`: batch/v1
- `kind`: CronJob
- `name`: cronjobs
- `short name`: cj
- `namespace`: true