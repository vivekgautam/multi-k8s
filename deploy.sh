docker build -t kviev/multi-client:latest -t kviev/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t kviev/multi-server:latest -t kviev/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t kviev/multi-worker:latest -t kviev/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push kviev/multi-client:latest
docker push kviev/multi-server:latest
docker push kviev/multi-worker:latest

docker push kviev/multi-client:$SHA
docker push kviev/multi-server:$SHA
docker push kviev/multi-worker:$SHA

# kubectl apply -f k8s
# kubectl set image deployments/server-deployment server=stephengrider/multi-server:$SHA
# kubectl set image deployments/client-deployment client=stephengrider/multi-client:$SHA
# kubectl set image deployments/worker-deployment worker=stephengrider/multi-worker:$SHA