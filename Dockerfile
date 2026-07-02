# Stage 1
FROM ubuntu:22.04 AS build

RUN apt update && apt install -y curl

RUN curl -fsSL https://code-server.dev/install.sh | sh


# Stage 2
FROM ubuntu:22.04 AS runtime

RUN useradd -m master

COPY --from=build /usr/bin/code-server /usr/bin/code-server
COPY --from=build /usr/lib/code-server /usr/lib/code-server

USER master

WORKDIR /home/master

EXPOSE 8080

CMD ["code-server", "--bind-addr", "0.0.0.0:8080"]


