FROM python as builder
WORKDIR /
COPY hello_world.go .
RUN python hello_world.py

FROM aws/codebuild/ubuntu-base:14.04
WORKDIR /root/
COPY --from=builder /hello_world.py .
CMD ["python hello_world.py"]
