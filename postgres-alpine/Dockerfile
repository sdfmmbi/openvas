# Stage 0: Start with a squashed fully updated ubuntu:20.04
# This is created seperately.
FROM ubuntu:20.04.u

# Ensure apt doesn't ask any questions 
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8

# Build/install gvm (by default, everything installs in /usr/local)
COPY build-gvm.sh /build-gvm.sh
RUN bash /build-gvm.sh

# Stage 1: Start again with the squashed fully updated ubuntu:20.04

FROM postgres:12-alpine
LABEL maintainer="scott@immauss.com" \
      description=" postgresql container with added bits to support gvmd 20.08 " \
      version="12" \
      url="https://hub.docker.com/immauss/openvas" \
      source="https://github.com/immauss/openvas"
      
      
#ENV DEBIAN_FRONTEND=noninteractive
# Copy the gvm install from stage 0
COPY --from=0 /usr/local/lib /usr/local/lib

# Ensure apt doesn't ask any questions 
#ENV DEBIAN_FRONTEND=noninteractive
# Install the bits needed to support gvmd
#RUN apt-get update && apt-get install -y libglib2.0-0 libical3 libgpgme11 libssh-gcrypt-4 libhiredis0.14 &&\
    #apt-get clean && \
# echo "/usr/local/lib" > /etc/ld.so.conf.d/openvas.conf && \
#   ldconfig

STOPSIGNAL SIGINT
EXPOSE 5432
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["postgres"]
