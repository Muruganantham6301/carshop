# Stage 1: build static site (optional, for preprocess)
FROM node:18-alpine AS build
WORKDIR /app
COPY . .
# If you'd like to process or bundle assets (e.g. via webpack, parcel, etc.), you could add build steps here.
# For now, we directly serve the raw HTML.

# Stage 2: lightweight HTTP server
FROM nginx:stable-alpine
COPY --from=build /app/index.html /usr/share/nginx/html/index.html
# Optional: Copy custom nginx.conf if needed
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
