# <b>NodePort</b>
- It is type of exposing port to world outside the Cluster.
- An application is accessed using any of the node IP address.

# <b>Format</b>
- `apiVersion`: v1
- `kind`: Service
- `name`: Services
- `short name`: svc
- `namespace`: true

Ex:
```
apiVersion: v1
kind: Service
metadata:
  name: ex-svc
spec:
  type: NodePort
  selector:
    app: nginx
  ports:
  - protocol: TCP
    port: 80
    targetPort: 80
    nodePort: 30001     # port to use from outside the Cluster
```

- <b>Pod</b> must be created before creating <b>Service</b> with same labels.