FROM  openjdk:8

ARG SBT_VERSION=1.2.8

# Install sbt
RUN \
  curl -L -o sbt-$SBT_VERSION.deb https://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
  dpkg -i sbt-$SBT_VERSION.deb && \
  rm sbt-$SBT_VERSION.deb && \
  apt-get update && \
  apt-get install sbt && \
  sbt sbtVersion

# Install Vault
RUN curl -fL https://releases.hashicorp.com/vault/1.0.0/vault_1.0.0_linux_amd64.zip --output ./vault.zip && unzip ./vault.zip && cp ./vault /usr/local/bin


