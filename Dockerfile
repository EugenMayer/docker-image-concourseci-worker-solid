FROM concourse/concourse:3.7.0
ADD worker_wrapper.sh /usr/local/bin/worker_wrapper
RUN chmod +x /usr/local/bin/worker_wrapper
ENTRYPOINT ["/usr/local/bin/worker_wrapper"]
CMD ["land-worker"]
