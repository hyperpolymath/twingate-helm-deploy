# SPDX-License-Identifier: PMPL-1.0-or-later
# Declarative schema/defaults for Helm values exported from Nickel.
{
  network | String = "your-network-name",
  connector = {
    logLevel | String = "info",
    analyticsEnabled | Bool = true,
  },
  kubernetes = {
    namespace | String = "twingate-system",
    replicaCount | Number = 2,
  },
  resources = {
    requests = {
      memory | String = "128Mi",
      cpu | String = "100m",
    },
    limits = {
      memory | String = "256Mi",
      cpu | String = "500m",
    },
  },
}
