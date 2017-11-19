Currently when running concourse-workers in non BOSH environments, like we do with `docker-compose`, see https://github.com/EugenMayer/concourseci-server-boilerplate
when you shutdown the stack for restart or upgrade, the worker becomes to be in a broken, undefined state, leading to a lot of different issues like

 - "file not found" when running a task /job in concourse or during a resource trigger
 - job / task is stalled / stuck in the "preparing build" state, not doing anything
 
 The main reasons are, that during the shutdown and the not proper persistence, the worker comes back online with a mixed state, see this issue
 https://github.com/concourse/concourse/issues/1457#issuecomment-345043523 for more details.
 
 What we do here is simply put, trap the worker and `concourse land-worker` before we kill / stop the worker-container
 And thats about it
 
 This image always is based on the latest concourse/concourse base image release and will not manipulate anything else then that wrapper