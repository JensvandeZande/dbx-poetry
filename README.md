# dbx-poetry
This is a Lean and Mean Databricks dbx template using poetry, cruft, and cookiecutter. This template, for now, is only suitable for etl jobs. Not ML jobs.


This cookiecutter uses a post-project hook to install a python pre-commit. For this, it is assumed that the project allready has a git repo initialized. If this is not the case, one should manually initialize a git repo using ```git init``` or by cloning a remote repo. After this run ```poetry run pre-commit-install```. This will ensure that when you run `git commit`, before your code is _actually_ committed, the checks (hooks) are run first.


## Quickstart
1. Install poetry:
```bash
apt-get install python3-venv
curl -sSL https://install.python-poetry.org | python3 -
export PATH="$HOME/.poetry/bin:$PATH"
```
2. If you don't have JDK installed on your local machine, install it:
```bash
sudo apt-get install openjdk-11-jdk
```
3. Install cruft:
```bash
pip install cruft
```
4. cd into your folder where you want to create your dbx project.
5. Create project skeleton using this template:
```bash
cruft create https://github.com/JensvandeZande/dbx-poetry.git
```
6. cd into your newly created project.
7. Create virtual environment using poetry and install:
```bash
poetry install
```
8. Create a new [Databricks API](https://docs.databricks.com/dev-tools/api/latest/authentication.html) token and configure the CLI and verify it is working. This command creates a hidden .dbx folder within your dbx project’s root folder. This .dbx folder contains lock.json and project.json files.
```bash
databricks configure --profile default --token
databricks --profile default workspace ls /
```
This will also generate a .databrickscfg file that looks something like this:
```
[DEFAULT]
host = <your-host>
token = <your-token>
jobs-api-version = 2.1
```
The project.json file defines an environment named default along with a reference to the DEFAULT profile within your Databricks CLI .databrickscfg file. If you want dbx to use a different profile, replace --profile DEFAULT with --profile followed by your target profile’s name, in the dbx configure command.

For example, if you have a profile named DEV within your Databricks CLI .databrickscfg file and you want dbx to use it instead of the DEFAULT profile, your project.json file might look like this instead, in which you case you would also replace --environment default with --environment dev in the dbx configure command:
```
{
  "environments": {
    "default": {
      "profile": "DEFAULT",
      "storage_type": "mlflow",
      "properties": {
        "workspace_directory": "/Shared/dbx/projects/<current-folder-name>",
        "artifact_location": "dbfs:/dbx/<current-folder-name>"
      }
    },
    "dev": {
      "profile": "DEV",
      "storage_type": "mlflow",
      "properties": {
        "workspace_directory": "/Shared/dbx/projects/<some-other-folder-name>",
        "artifact_location": "dbfs:/dbx/<some-other-folder-name>"
      }
    }
  }
}
```
If you want dbx to use the DATABRICKS_HOST and DATABRICKS_TOKEN environment variables instead of a profile in your Databricks CLI .databrickscfg file, then leave out the --profile option altogether from the dbx configure command.

Now that we have prepared the local setup, you can now start filling in the template/skeleton.


## References
Please look at the [dbx documentation](https://dbx.readthedocs.io/en/latest/) for more information on dbx.