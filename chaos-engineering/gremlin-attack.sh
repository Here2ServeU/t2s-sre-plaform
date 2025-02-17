# Gremlin Attack Script - gremlin-attack.sh
#!/bin/bash
# Gremlin CPU and Network Chaos Attack

echo "Starting Gremlin CPU and Network attack..."

gremlin attack cpu --length 60 --cores 2
sleep 5
gremlin attack network --length 60 --percent 50


echo "Gremlin attack completed. Verifying impact..."
kubectl get pods -n t2s-app
