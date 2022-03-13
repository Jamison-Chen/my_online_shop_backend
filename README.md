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

The My Online Shop Project is the prototype of an e-commerce website,
this website is currently implemented with the following key functions:

* Account
  * User Registration
  * Email Verification
  * User Login / Logout
  * User Info Editing and Password Changing
* Product
  * Favorites
  * Cart
  * Single-Layer Product Classification
  * Product Specification Selection
* Checkout & Order
  * The overall workflow **BEFORE** selecting pick-up location
  * Order Tracking

The My Online Shop project is divided into two parts, frontend and backend respectively,
and this repository is the backend. To see the frontend repository, please visit
[this page](https://github.com/Jamison-Chen/my_online_shop).

In this document, we will guide you through the process of installing the backend
of the My Online Shop project.

## Contents

If you want to directly jump to some specific part of this document,
here we provide you the contents overview with link:

* [Installation](#title-installation)
* [Start to Develop](#title-start-to-develop)
* [Making Contributions](#title-making-contribution)
* [Development Roadmap](#title-development-roadmap)

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
* [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli)

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

  >  ***Notes***
  >
  > * *Your Python version should be higher than 3.9*
  > * *The version you got might look like 3.x.x, just ignore the last part
      including and after the second dot.*

* Step4: Install the virtual Python environment.

    First, you have to *cd* to the root of the project directory cloned.
    Then, you can run the command below:

    ```bash
    pipenv install psycopg2
    ```

  > ***Notes***
  >
  > * *The command above might seem like that it only install the package called
      psycopg2, but what it does is installing **every** packages stated in the Pipfile
      **and** the psycopg2 package.*

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

<font size="1">*[Back to contents](#contents)*</font>

<h2 id="title-start-to-develop">Start to Develop</h2>

#### Run the local server for development

Under the root directory (where the `manage.py` file is located), run:

```bash
pipenv shell
python manage.py runserver
```

#### Make migrations

Whenever you modify any `models.py` files, you will need to make migration files
so that the database schema can be migrated according to instructions in those files.

```bash
pipenv shell
python manage.py makemigrations
```

#### Migrate the database schema

```bash
python manage.py migrate
```

<font size="1">*[Back to contents](#contents)*</font>

<h2 id="title-making-contribution">Making Contributions</h2>

> If you just want to perform continuous integration in a simple
  magic command and don't want to know what exactly will happen,
  here's that magic command:
>
> For MacOS developers:
>
> ```bash
> sh deploy.sh
> ```
>
> For Windows developers:
>
> ```bat
> deploy.bat
> ```
>
> Run this and you can skip the rest of this paragraph.

#### Prepare the `requirements.txt` file before pushing to the remote branch

> We use **Heroku** as the cloud server for this app.

If you updated, installed or unistalled any packages during the phase of developing
your latest version, you will need to tell Heroku the current environment requirements
of the project by running the following command under the root directory:

```bash
pipenv lock --requirements > requirements.txt
```

and you will see some changes in the `requirements.txt` file afterwards.

#### Commit and push to the remote branch

  ```bash
  git add .
  git commit -m "your commit title" -m "your description"
  git push origin master
  ```

Heroku will detect your action of pushing a new version up to the
remote GitHub branch via GitHub webhooks, and will then build this latest version
automatically.

After a successful build, it comes to the release phase. In this phase, Heroku will
migrate the database shchema using the instructions written in the `Procfile` file.
(*c.f. [https://devcenter.heroku.com/articles/release-phase](https://devcenter.heroku.com/articles/release-phase)*)

The processes of building and releasing take time (about 2 minutes), so you will
need to wait a moment to see the correct version of your online product.

<font size="1">*[Back to contents](#contents)*</font>

<h2 id="title-development-roadmap">Development Roadmap</h2>

The list below shows features that we are going to implement in the future releases:

* Account
  * Need a mail agent for the online version to achieve the email verification.
  * Maybe use Session instead of Cookie to keep the user’s login status.
* Product
  * Multi-Layer Product Classification
  * Provide more sections such as “Popular This Week”, “New Arrival”, etc.
  * The product searching algorithms
* Checkout & Order
  * Provide coupons and let customers apply them before checking out.
  * Provide a map to select stores when customers choose to pick up their
  products in-store.
  * The workflow of payment
