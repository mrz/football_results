# FootballResults

To start the application:

  * Install dependencies with `mix deps.get`
  * Create and start the pgsql docker container with `./start_postgres.sh`; if
    it's the first time, edit the file and uncomment the first command, which
    creates the volume
  * Create, migrate and seed the database with `./setup_db.sh`; this step
    requires the `Data.csv` file in the root of the project
  * Install Node.js dependencies with `cd assets && npm install && node
    node_modules/webpack/bin/webpack.js --mode development`
  * Start Phoenix endpoint with `mix phx.server`
