FROM node:22-alpine

WORKDIR /app

# Install pnpm
RUN npm install -g pnpm@10.22.0

# Copy monorepo files
COPY . .

# Install dependencies
RUN pnpm install --frozen-lockfile

# Build n8n
RUN pnpm run build:deploy

# Expose port
EXPOSE 5678

# Start n8n
CMD ["pnpm", "start"]
