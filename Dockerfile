FROM alpine:3.17

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM" > /log

RUN apk add curl

# Prepare kubectl
ENV KUBECTL_VERSION=1.23.15
RUN curl -sLO https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/${TARGETPLATFORM}/kubectl && mv kubectl /usr/bin/kubectl && chmod +x /usr/bin/kubectl
RUN kubectl version

# Prepare aws cli
#RUN apk add --update --no-cache python3 && python3 -m ensurepip && pip3 install --upgrade pip &&  pip3 install awscli && pip3 cache purge
#RUN aws --version