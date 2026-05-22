<!-- SPDX-License-Identifier: MPL-2.0 -->
<!-- TOPOLOGY.md — Project architecture map and completion dashboard -->
<!-- Last updated: 2026-02-19 -->

# twingate-helm-deploy — Project Topology

## System Architecture

```
                        ┌─────────────────────────────────────────┐
                        │              TWINGATE CLOUD             │
                        │        (Access Control Plane)           │
                        └───────────────────┬─────────────────────┘
                                            │ Secure Tunnel
                                            ▼
                        ┌─────────────────────────────────────────┐
                        │           TWINGATE CONNECTOR            │
                        │    (Kubernetes Pod, Zero-Trust Ingress) │
                        └──────────┬───────────────────┬──────────┘
                                   │                   │
                                   ▼                   ▼
                        ┌───────────────────────┐  ┌────────────────────────────────┐
                        │ CLUSTER ACCESS        │  │ DEPLOYMENT LAYER (HELM)        │
                        │ - Service Routing     │  │ - Chart Templates              │
                        │ - RBAC Bindings       │  │ - Network Policies             │
                        │ - Health Endpoints    │  │ - Nickel Value Templates       │
                        └──────────┬────────────┘  └──────────┬─────────────────────┘
                                   │                          │
                                   └────────────┬─────────────┘
                                                ▼
                        ┌─────────────────────────────────────────┐
                        │           TARGET RESOURCES              │
                        │  ┌───────────┐  ┌───────────┐  ┌───────┐│
                        │  │ ZeroTier  │  │ IPFS      │  │ App   ││
                        │  │ Overlay   │  │ Nodes     │  │ Svcs  ││
                        │  └───────────┘  └───────────┘  └───────┘│
                        └─────────────────────────────────────────┘

                        ┌─────────────────────────────────────────┐
                        │          REPO INFRASTRUCTURE            │
                        │  Justfile Automation  .machine_readable/  │
                        │  Mustfile / Helm      0-AI-MANIFEST.a2ml  │
                        └─────────────────────────────────────────┘
```

## Completion Dashboard

```
COMPONENT                          STATUS              NOTES
─────────────────────────────────  ──────────────────  ─────────────────────────────────
CORE DEPLOYMENT
  Helm Chart (Connector)            ██████████ 100%    StatefulSet & Deployment stable
  Value Templates (Nickel)          ██████████ 100%    Base/Prod/Staging verified
  RBAC & Network Policies           ██████████ 100%    Strict access verified
  Connector Pod Configuration       ██████████ 100%    Secure tunnel stable

INTERFACES & INFRA
  Credential Ingestion              ██████████ 100%    Vault/MCP integration active
  Health Metrics (Prometheus)       ██████████ 100%    Metrics endpoint verified
  Rollout Scripts (Just)            ██████████ 100%    Automated deploy verified

REPO INFRASTRUCTURE
  Justfile Automation               ██████████ 100%    Standard build/deploy tasks
  .machine_readable/                ██████████ 100%    STATE tracking active
  0-AI-MANIFEST.a2ml                ██████████ 100%    AI entry point verified

─────────────────────────────────────────────────────────────────────────────
OVERALL:                            ██████████ 100%    Production-ready ingress
```

## Key Dependencies

```
Twingate Cloud ──► Access Token ────► Connector Pod ─────► Secure Ingress
     │                 │                   │                    │
     ▼                 ▼                   ▼                    ▼
Helm Values ─────► K8s Context ──────► Network Policy ───► Target Service
```

## Update Protocol

This file is maintained by both humans and AI agents. When updating:

1. **After completing a component**: Change its bar and percentage
2. **After adding a component**: Add a new row in the appropriate section
3. **After architectural changes**: Update the ASCII diagram
4. **Date**: Update the `Last updated` comment at the top of this file

Progress bars use: `█` (filled) and `░` (empty), 10 characters wide.
Percentages: 0%, 10%, 20%, ... 100% (in 10% increments).
