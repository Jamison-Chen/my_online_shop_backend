<p align="center">
    <div align="center">
        <a href="#">
            <img src="https://img.shields.io/github/contributors/Jamison-Chen/my_online_shop_backend?color=fbbc05" alt="Contributors" />
        </a>
        <a href="#">
            <img src="https://img.shields.io/github/license/Jamison-Chen/my_online_shop_backend" alt="Licence" />
        </a>
        <a href="#">
            <img src="https://img.shields.io/github/issues/Jamison-Chen/my_online_shop_backend?color=ea4335" alt="Issues" />
        </a>
    </div>
    <!-- <p align="center">
        <a href="#" align="center">
            <img alt="logo" height="50px" src="https://www.edigitalagency.com.au/wp-content/uploads/google-logo-png-transparent-background-large-new.png"/>
        </a>
    </p> -->
</p>
<!-- ![Contributors](https://img.shields.io/github/contributors/Jamison-Chen/my_online_shop_backend)
![Forks](https://img.shields.io/github/forks/Jamison-Chen/my_online_shop_backend)
![Stars](https://img.shields.io/github/stars/Jamison-Chen/my_online_shop_backend)
![Licence](https://img.shields.io/github/license/Jamison-Chen/my_online_shop_backend)
![Issues](https://img.shields.io/github/issues/Jamison-Chen/my_online_shop_backend) -->

<h1 align="center">My Online Shop</h1>

The My Online Shop project is divided into two parts, frontend and backend respectively,
and this repository is the backend. To see the frontend repository, please visit
[this page](https://github.com/Jamison-Chen/my_online_shop).

We will guide you to install the backend of the My Online Shop project through
this document.

If you want to directly jump to some specific part of this document,
here we provide you the contents overview with link:

* [Installation](#title-installation)
* [Making Contribution](#title-making-contribution)

If you want to see the demo of the whole project, please visit [here](https://jamison-chen.github.io/my_online_shop/).

Note that the demo provided above is the combination of both the frontend and the
backend, so only setting this subproject up will not result in the same thing
as the demo.

<h2 id="title-installation">Installation</h2>

#### Environment Prerequisite

* [Python 3.9 +](https://www.python.org/downloads/)
* [pipenv](https://pypi.org/project/pipenv/)
* [Postgresql 14.x](https://www.postgresql.org/download/)
* [Git 2.35.x](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

#### Install for Development

* Step1: Clone the repository from GitHub.

    ```bash
    git clone https://github.com/Jamison-Chen/my_online_shop_backend.git
    ```

* Step2: Check the version of Python installed on your machine.

    ```bash
    python --version
    ```

    If the command above results in an error, try `python3 --version` instead.

* Step3: Edit the Pipfile.

    Open the Pipfile in the root of the project directory cloned with any of the
    proper code editor. Scroll down to the bottom part, and you will see something
    like:

    ```text
    [requires]
    python_version = "3.10"
    ```

    Change the "3.10" here to the Python version you got in the previous step.

    ***Notes***
  * *Your Python version should be higher than 3.9*
  * *The version you got might look like 3.x.x, just ignore the last part
    including and after the second dot.*

* Step4: Install the virtual Python environment.

    First, you have to *cd* to the root of the project directory cloned.
    Then, you can run the command below:

    ```bash
    pipenv install psycopg2
    ```

    ***Notes***
  * *The command above might seem like that it only install the package called psycopg2,
    but what it does is installing **every** packages stated in the Pipfile **and**
    the psycopg2 package.*

* Step5: Create a database for this project.

  * Step5-1: Open the Postgresql server.

    ```bash
    brew services start postgresql
    ```

  * Step5-2: Open the Postgresql terminal abbreviated as *psql*, and connect to
    the default database called *postgres*.

    ```bash
    psql postgres
    ```

  * Step5-3: Create a new database and name it "my_online_shop".

    ```postgresql
    CREATE DATABASE my_online_shop;
    ```

  * Step5-4: Alter the owner of the database to *postgres*.

    ```postgresql
    ALTER DATABASE my_online_shop OWNER TO postgres;
    ```

* Step6: Setup the database.

  * Step6-1: Activate the virtual environment created in Step4
    under the root directory of this project.

    ```bash
    pipenv shell
    ```

  * Step6-2: Execute the following command under this directory.

    ```bash
    python manage.py migrate
    ```

<h2 id="title-making-contribution">Making Contribution</h2>

#### Run the Server Locally

Activate the virtual environment and run the manage.py file with argument under
the root directory.

```bash
pipenv shell
python manage.py runserver
```
