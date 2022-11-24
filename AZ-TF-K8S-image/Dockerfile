FROM alpine:3.11


ENV AZURE_CLI_VERSION  2.40.0
ENV TERRAFORM_VERSION 1.3.1
ENV KUBE_VERSION v1.25.0
# Install needed packages and Azure CLI
RUN apk add \
    python3 \
    curl \ 
    git \
    jq \
    gettext && \
    apk add --virtual .build-deps \
    gcc \
    libffi-dev \
    musl-dev \
    openssl-dev \
    make \
    python3-dev \
    linux-headers && \
    pip3 install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir azure-cli==$AZURE_CLI_VERSION && \
    apk del .build-deps && \
    rm -rf /var/cache/apk/*

# Install Terraform
RUN curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip | unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin - && \
    chmod +x /usr/local/bin/terraform

# Install kubectl
RUN curl -L https://storage.googleapis.com/kubernetes-release/release/$KUBE_VERSION/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl


WORKDIR /work