FROM suse/sles12sp1:latest
MAINTAINER Flavio Castelli <fcastelli@suse.com>
MAINTAINER Alejandro Bonilla <abonilla@suse.com>

# Create a new demo_user.
RUN /usr/sbin/useradd -m demo_user

# Add our demo application inside of the /demo/ directory, the app is going
# to be renamed from webapp_demo to webapp.
ADD webapp /demo/webapp
ADD web /demo/web

WORKDIR /demo

# Run everything as the "demo_user" user.
USER demo_user

# The demo web application listens on port 8080 by default
# This directive tells Docker that the container will listen on the specified
# port at runtime. This is information is used when connecting multiple running
# containers.
EXPOSE 8080

#Add EntryPoint

ENTRYPOINT ["./demo/webapp"]
