FROM nginx:alpine

# Set working directory to nginx asset directory
WORKDIR /usr/share/nginx/html
# Remove default nginx static assets
RUN mkdir -p /cmap/prism/PRISM-website/dist
RUN rm /etc/nginx/conf.d/*
COPY website.conf /etc/nginx/conf.d/
# Copy static assets from builder stage
COPY dist /cmap/prism/PRISM-website/dist

# Set correct permissions
RUN chown -R nginx:nginx /cmap/prism/PRISM-website/dist
RUN chmod -R 755 /cmap/prism/PRISM-website/dist
# Containers run nginx with global directives and daemon off
EXPOSE 8080

ENTRYPOINT ["nginx", "-g", "daemon off;"]

#
#CMD ["npm", "run", "serve"]
