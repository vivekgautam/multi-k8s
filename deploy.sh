docker build -t vivekgautam/multi-client:latest -t vivekgautam/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t vivekgautam/multi-server:latest -t vivekgautam/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t vivekgautam/multi-worker:latest -t vivekgautam/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push vivekgautam/multi-client:latest
docker push vivekgautam/multi-server:latest
docker push vivekgautam/multi-worker:latest

docker push vivekgautam/multi-client:$SHA
docker push vivekgautam/multi-server:$SHA
docker push vivekgautam/multi-worker:$SHA

# kubectl apply -f k8s
# kubectl set image deployments/server-deployment server=stephengrider/multi-server:$SHA
# kubectl set image deployments/client-deployment client=stephengrider/multi-client:$SHA
# kubectl set image deployments/worker-deployment worker=stephengrider/multi-worker:$SHA