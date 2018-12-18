FROM jonaskello/docker-and-compose:1.12.1-1.8.0

# Download and install Google Cloud SDK
RUN apk add --no-cache --update make ca-certificates openssl python \
    && update-ca-certificates \
    && wget https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz \
    && tar zxvf google-cloud-sdk.tar.gz && ./google-cloud-sdk/install.sh --usage-reporting=false --path-update=true \
    && /google-cloud-sdk/bin/gcloud --quiet components update

ENV PATH="/google-cloud-sdk/bin:${PATH}"

# If using Docker 1.13+ you can install the credential helper
# RUN gcloud components install docker-credential-gcr \
#    && docker-credential-gcr configure-docker


