FROM almalinux:9
RUN dnf install nginx -y
RUN rm -rf /usr/share/nginx/html/index.html 
ADD https://raw.githubusercontent.com/peddireddylokesh/dockerfiles/refs/heads/main/run/Dockerfile /usr/share/nginx/html/index.html
CMD ["nginx","-g","daemon off;"]

