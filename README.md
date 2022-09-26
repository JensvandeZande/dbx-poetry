# dbx-poetry
Databricks dbx project template using poetry, cruft, and cookiecutter. This template, for now, is only suitable for etl jobs. Not ML jobs.


This cookiecutter uses a post-project hook to install a python pre-commit. For this, it is assumed that the project allready has a git repo initialized. If this is not the case, one should manually initialize a git repo using ```git init``` or by cloning a remote repo. After this run ```poetry run pre-commit-install```. This will ensure that when you run `git commit`, before your code is _actually_ committed, the checks (hooks) are run first.