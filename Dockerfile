FROM alpine:3.19
RUN echo "Hello from Docker image built by Jenkins!"
CMD ["sh", "-c", "echo Container started successfully; sleep 5"]
