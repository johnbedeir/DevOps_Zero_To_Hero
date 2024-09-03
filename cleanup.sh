imagename="zero-to-hero-img"
container_name="zero-to-hero-container"
hub_imagename="triple3a/zero-to-hero-py-img"
namespace="zero-to-hero"

docker stop ${container_name} || true

docker rm ${container_name} || true

docker rmi ${imagename} || true

docker rmi ${hub_imagename} || true

kubectl delete ns ${namespace}

minikube stop