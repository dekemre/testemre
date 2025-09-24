apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: keycloak
  namespace: argocd
  finalizers:
  - resources-finalizer.argocd.argoproj.io
spec:
  project: default
  destination:
    server: https://kubernetes.default.svc
    namespace: argocd
  syncPolicy:
    automated:
      selfHeal: true
  source:
    repoURL: https://github.com/dekemre/testemre.git
    path: keycloak
    targetRevision: main
    # helm:
    #   values: | # Inline values go here