# Troubleshooting Guide

## Common Issues and Fixes

### **1. Kubernetes Pods Not Starting**
**Error:** `CrashLoopBackOff`

**Solution:**
```sh
kubectl describe pod <pod-name> -n t2s-app
kubectl logs <pod-name> -n t2s-app
```

---

### **2. Helm Deployment Fails**
**Error:** `Error: INSTALLATION FAILED: timed out waiting for the condition`

**Solution:**
```sh
helm uninstall backend -n t2s-app
helm upgrade --install backend helm/backend-chart --namespace t2s-app
```

---

### **3. CI/CD Pipeline Fails**
**Error:** `Docker build failure in GitHub Actions`

**Solution:**
- Ensure **secrets** are configured properly in GitHub Actions.
- Re-run workflow manually from GitHub UI.
- Check logs using:
```sh
gh run watch
```

---

**Need More Help?**
- Refer to the [GitHub Discussions](https://github.com/Here2ServeU/t2s-sre-plaform/discussions).
- Create an **Issue** if you run into a new problem.

Happy Deploying!
