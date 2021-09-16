# Start Postgresql Docker container

docker run -p 5433:5432 -d \
  -e USER=postgres \
  -e POSTGRES_USER=jobs_finder \
  -e POSTGRES_PASSWORD=password \
  -v postgresql:/var/lib/postgres/data:delegated \
  postgres

