Kubernetes/Docker deployment of Node.js application (E2E)

1. Difference between pod and deployment --> Deployment always highly available but pod is not. If pod terminates K8S doesn't create another pod. If pod in deployment gets deleted K8S creates another pod immediatly. 
2. kubectl get po -n nodejs -o wide --> Check to which worker nodes pods got deployed 
3. If you want all pods deployed on different worker nodes and scale the pods while scaling the worker nodes we should deploy it as DeamonSet.
4. If we use the service for DB we always use Headless service 
5. kubectl patch storageclass efs -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'