FROM postgres:13-alpine

COPY schema.sql /docker-entrypoint-initdb.d/
COPY migrations/ /migrations/

ENV POSTGRES_DB=snake_game
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=password

EXPOSE 5432
