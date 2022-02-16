FROM openjdk:17-jdk-slim

ENV VELOCITY_VERSION=3.1.1
ENV VELOCITY_BUILD=98

RUN apt-get update && \
  apt-get install -y dumb-init curl && \
  adduser --system --uid 1000 --disabled-password --home /home/minecraft minecraft

WORKDIR /home/minecraft

RUN curl https://papermc.io/api/v2/projects/velocity/versions/${VELOCITY_VERSION}/builds/${VELOCITY_BUILD}/downloads/velocity-${VELOCITY_VERSION}-${VELOCITY_BUILD}.jar -o velocity.jar

COPY configs/* ./
COPY entrypoint.sh entrypoint.sh
RUN chown minecraft:nogroup -R . && ls -la

USER minecraft
ENV USER=minecraft HOME=/home/minecraft

ENTRYPOINT [ "./entrypoint.sh" ]
