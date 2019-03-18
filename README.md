# Docker Image for Confluence Publisher Integration Tests

This Docker images uses a public developer testing license from Atlassian (see https://developer.atlassian.com/platform/marketplace/timebomb-licenses-for-testing-server-apps/). 
This license expires 3 hours after starting the Confluence Docker container.

## Update Confluence Version
Adjust the Confluence version of the base image in `Dockerfile`

Run the following command to migrate the Confluence data:

`docker run -v <absolute-path-to-repo>/data/confluence-data:/var/atlassian/application-data/confluence -d -p8090:8090 -p8091:8091 atlassian/confluence-server:<version>`

Wait for Confluence to start and migrate its data, then stop the Confluence container and commit all changes in `data/confluence-data`. Then build and push a new image as described below.

## Build Confluence Publisher Integration Test Image
Run the following command to build and push the image:

`docker build -t confluencepublisher/confluence-publisher-it:<version> .`

`docker push confluencepublisher/confluence-publisher-it:<version>` (requires access to DockerHub for confluencepublisher)

## Run Confluence Publisher Integration Test Image
Run the following command to start the container:

`docker run --rm -d -p8090:8090 -p8091:8091 --name=confluence-publisher-it confluencepublisher/confluence-publisher-it:<version>`

## Confluence Users

The following users are configured in Confluence:

- admin/admin
- confluence-publisher-it/1234
