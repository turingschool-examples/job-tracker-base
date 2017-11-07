# Job Tracker

This repository will be used as starter code for various assignments at Turing.

```
# fork first!
git clone git@github.com:<your_username>/job-tracker.git
cd job-tracker
bundle install
bundle exec rake db:setup
bundle exec rails server
```

Submit your solution with a Pull Request.
## Final Independent Assessment

We'll be using the [Job Tracker Application](https://github.com/turingschool-examples/job-tracker-base).

1. Fork the repo
2. Clone down your fork
3. Implement the three stories below
  * Commit every 15 minutes
4. Open a PR with the `turingschool-examples` repo as the base and your updated fork as the head.
5. Tag your instructors in the main PR message.

Students need to implement the following three user stories:

<!-- ```txt
As a user,
When I visit a specific job page,
I see the name of each of the tags associated with that job.
``` -->

```txt
As a user,
When I visit a specific job page,
I also see a count of how many jobs have each specific tag listed.
```

```txt
As a user,
When I visit a specific job page,
I also see an average salary for all jobs within each specific tag listed.
```


#### Example:

```txt
Job : Developer

Tags: Software - 5 (100000), Good-Location - 9 (75000)
```
