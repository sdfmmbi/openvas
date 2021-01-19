FROM postgres:12
# Ensure apt doesn't ask any questions 
ENV DEBIAN_FRONTEND=noninteractive

# Install the bits needed to support gvmd
RUN apt-get install -y libglib2.0-0 libical3 libgpgme11 libssh-gcrypt-4 libhiredis0.14

# We also need the gvm libs. These need to be pulled from the gvm container image.
COPY libs/* /usr/local/lib 
