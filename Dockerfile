# Development image for dbc-lens
FROM node:24-bookworm-slim

ENV NEXT_TELEMETRY_DISABLED=1

# Prepare folders owned by the non-root "node" user,
# so files created in the container are not owned by root.
RUN mkdir -p /app/node_modules && chown -R node:node /app
WORKDIR /app
USER node

EXPOSE 3000
CMD ["npm", "run", "dev", "--", "-H", "0.0.0.0"]
