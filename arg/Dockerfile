ARG version
FROM almalinux:${version:-9}
ENV course="devops with aws"\
    trainer="ShivaKumar Reddy"\
    duration="3 months"
ARG username=loki
RUN echo "Hello user : ${username}, image version : ${version}" > /tmp/devops.txt
CMD ["sleep","150"]
