Kubernetes/Docker deployment of Node.js application (E2E)

1. Difference between pod and deployment --> Deployment always highly available but pod is not. If pod terminates K8S doesn't create another pod. If pod in deployment gets deleted K8S creates another pod immediatly. 