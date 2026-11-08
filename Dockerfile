FROM node:22-alpine

WORKDIR /app

# Copy package files with node ownership
COPY --chown=node:node package*.json ./

# Install dependencies
RUN npm install --omit=dev

# Copy application source code with node ownership
COPY --chown=node:node . .

# Expose port 3000
EXPOSE 3000

# Define environment variable
ENV NODE_ENV=production

# Switch to non-root user
USER node

# Start application
CMD ["npm", "start"]