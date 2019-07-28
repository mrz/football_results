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

With docker-compose
  * Build app image with `docker build -t phoenix:v1 .`
  * Initialize a docker swarm with `docker swarm init`
  * Deploy the platform using `docker stack deploy --compose-file=./docker-compose.yaml football_results`;
    this step will start a docker network, the haproxy service, the database
    service and the football_results service replicated over 3 containers.
    Access to the API is through haproxy, bound on the port 80, and can be
    reached through the docker0 network interface.
