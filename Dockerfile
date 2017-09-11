FROM alpine:3.6
MAINTAINER Lars Cromley <lars@callmeradical.com>

RUN apk --no-cache add python py-pip \
  && pip install cfn-flip

ENTRYPOINT ["/usr/bin/cfn-flip"]
