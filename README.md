# Municipal Registry (Ruby on Rails)

This is a simple CRUD for registering municipalities and addresses related to them.

## Project information

* Ruby version:
    - 3.0.1

* Rails version:
    - 6.1.4.1

* System dependencies
    - ruby ​​(3.0.1)
    - rails (6.1.4.1)
    - Text editor, suggestion (Visual Studio Code), it can be what you prefer.

* Database initialization
    - rails db:create
    - Obs: This project uses the sqlite database, because of that the command above will start and build the database based on the project structure.

* Run the project
    - rails s
    - Obs: The command starts the development server, when started it will be available at url [http://localhost:3000](http://localhost:3000)

## Configuring project for use

After downloading the project, perform the following steps to make the project available for execution.

* Run the following commands
    - bundle install
    - rails db:create
    - rails db:migrate

The command 'bundle install' will install the project's dependencies, 'rails db:create' will create the database based on the structure present in the project and 'rails db:migrate' will create the tables based on the migrations present in the system.