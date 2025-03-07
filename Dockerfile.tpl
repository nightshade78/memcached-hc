# Build from memcached image
FROM memcached:MCVERARG

# Set maintainer
LABEL maintainer="Nightshade nightshade@tdfc.de"

# Switch to root user for apt-get
USER root

# Install additional required packages
RUN apt-get update \
    && apt-get install -y netcat-traditional nano \
    && apt-get clean \
    # Cleanup apt caches
    && rm -r /var/lib/apt/lists/*

# Switch back to default memcache user
USER memcache

# Add the health check mechanism
HEALTHCHECK --start-period=3s --timeout=2s --interval=10s CMD ["/bin/nc","-z","127.0.0.1","11211"]
