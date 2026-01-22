# Twingate Connector Deployment Guide

Deploy Twingate Connector to Kubernetes for zero-trust network access.

## Prerequisites
- Kubernetes cluster
- Helm 3+
- Twingate account with network created
- Access/refresh tokens from Twingate

## Quick Start

1. Get credentials from Twingate Admin Console
2. Set environment variables:
```bash
export TWINGATE_ACCESS_TOKEN="your-access-token"
export TWINGATE_REFRESH_TOKEN="your-refresh-token"
```

3. Configure secrets:
```bash
just configure-secrets
```

4. Deploy:
```bash
just deploy production
```

5. Verify:
```bash
just status
just health-check
```

## Integration with ZeroTier

Route Twingate traffic through ZeroTier overlay:
- Deploy zerotier-k8s-link first
- Twingate connector automatically uses ZeroTier mesh

See: https://github.com/hyperpolymath/zerotier-k8s-link
