# Use AST Base image
FROM checkmarx/ast-cli:2.3.46@sha256:d327a3d1836887eb28afcc6904458878eeabfbc32ed77fb4a7ca558d4e248c75

# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY scripts /app/scripts/
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh \
    && chmod +x /app/scripts/


HEALTHCHECK NONE
