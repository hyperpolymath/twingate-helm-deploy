# SPDX-License-Identifier: MPL-2.0
# twingate-helm-deploy module manifest for FlatRacoon orchestrator
#
# This Nickel configuration file defines the metadata and integration points for the
# Twingate Helm deployment module within the FlatRacoon ecosystem.
# It is used by the orchestrator to resolve dependencies, scheduling, and configuration validation.

{
  # The unique identifier for this module within the ecosystem registry.
  name = "twingate-helm-deploy",

  # Semantic versioning for the module implementation.
  version = "0.1.0",

  # The architectural layer this module belongs to.
  # 'access' indicates this component manages ingress/egress and connectivity policies.
  layer = 'access,

  # Human-readable description of the module's functionality.
  description = "Twingate zero-trust connector deployed via Helm for secure private network access",

  # Source repository for the module code.
  repo = "github.com/hyperpolymath/twingate-helm-deploy",

  # List of capabilities or services that must be present for this module to function.
  # "kubernetes" implies a dependency on a running K8s cluster (managed by poly-k8s-mcp).
  requires = ["kubernetes"],

  # List of capabilities this module exposes to other components.
  # "secure-access" and "zero-trust-ingress" can be consumed by dependent services.
  provides = ["secure-access", "zero-trust-ingress"],

  # Path to the JSON schema (defined in Nickel) for validating configuration inputs.
  config_schema = "configs/schema.ncl",

  # Endpoints for health checking and metrics gathering, used by the monitoring stack.
  health_endpoint = "/health",
  metrics_endpoint = "/metrics",

  # The deployment strategy used by the orchestrator.
  # "helm" indicates that this module is deployed using Helm charts.
  deployment_mode = "helm",

  # The Kubernetes namespace where resources will be deployed.
  namespace = "twingate-system",
}
