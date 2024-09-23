# Satisfactory Dedicated Server

Why another dedicated server image? Because the images I found unnessarily use a lot of custom shell scripts, which is hard to audit.
This one is intended to be as simple as possible.

It is intended to be deployed in Kubernetes. To use, run `kubectl apply -k deploy`. Then find the IP of the service with `kubectl get svc satisfactory` in the `EXTERNAL-IP` field. Use this to connect to the server in the Game.

Note the pre-built image only work on Alibaba Cloud cn-beijing region. If you want to use it elsewhere, remove the "-vpc" in the domain name, or just build your own image.

The storage class I use：
```yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: alibabacloud-disk
parameters:
  type: cloud_auto,cloud_essd,cloud_ssd,cloud_efficiency
provisioner: diskplugin.csi.alibabacloud.com
reclaimPolicy: Delete
volumeBindingMode: WaitForFirstConsumer
allowVolumeExpansion: true
```
