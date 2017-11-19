FROM concourse/concourse
ADD worker_handler.sh /usr/local/bin/worker_handler
RUN chmod +x /usr/local/bin/worker_handler
ENTRYPOINT ['worker_handler']
CMD ['land-worker']
