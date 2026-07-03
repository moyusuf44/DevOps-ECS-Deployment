# Stage 1: Build Stage 

FROM ubuntu:22.04 AS build 

RUN apt update && apt install curl -y 
RUN curl -fsSL https://code-server.dev/install.sh | sh 

# Stage 2: Runtime Stage 

FROM ubuntu:22.04 AS runtime-stage 

RUN useradd -m master 

WORKDIR /my-app 

COPY --from=build /usr/bin/code-server /usr/bin/code-server 
COPY --from=build /usr/lib/code-server /usr/lib/code-server 

ENV PASSWORD=admin123

USER master 

EXPOSE 8080

CMD ["code-server", "--bind-addr", "0.0.0.0:8080"]

