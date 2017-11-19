FROM concourse/concourse
ADD worker_handler.sh /usr/local/bin/worker_handler
RUN chmod +x /usr/local/bin/worker_handler
CMD ['worker_handler']
