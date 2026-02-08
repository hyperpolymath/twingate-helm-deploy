# SPDX-License-Identifier: PMPL-1.0-or-later
# twingate-helm-deploy module manifest for FlatRacoon orchestrator

{
  name = "twingate-helm-deploy",
  version = "0.1.0",
  layer = 'access,
  description = "Twingate zero-trust connector deployed via Helm for secure private network access",
  repo = "github.com/hyperpolymath/twingate-helm-deploy",
  requires = ["kubernetes"],
  provides = ["secure-access", "zero-trust-ingress"],
  config_schema = "configs/schema.ncl",
  health_endpoint = "/health",
  metrics_endpoint = "/metrics",
  deployment_mode = "helm",
  namespace = "twingate-system",
}
