docker build -t kviev/multi-client:latest -t kviev/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t kviev/multi-server:latest -t kviev/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t kviev/multi-worker:latest -t kviev/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push kviev/multi-client:latest
docker push kviev/multi-server:latest
docker push kviev/multi-worker:latest

docker push kviev/multi-client:$SHA
docker push kviev/multi-server:$SHA
docker push kviev/multi-worker:$SHA

sudo kubectl apply -f k8s
sudo kubectl set image deployments/server-deployment server=kviev/multi-server:$SHA
sudo kubectl set image deployments/client-deployment client=kviev/multi-client:$SHA
sudo kubectl set image deployments/worker-deployment worker=kviev/multi-worker:$SHA