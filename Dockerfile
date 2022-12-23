FROM alpine:3.17


#ENV ARCH=aarch64
ENV ARCH=x86_64

RUN apk add curl

# Prepare kubectl
ENV KUBECTL_VERSION=1.23.15
RUN curl -sLO https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/${ARCH}/kubectl && mv kubectl /usr/bin/kubectl && chmod +x /usr/bin/kubectl


# Prepare aws cli
RUN apk add --update --no-cache python3 && python3 -m ensurepip && pip3 install --upgrade pip &&  pip3 install awscli && pip3 cache purge


RUN kubectl
RUN aws --version