# SPDX-License-Identifier: PMPL-1.0-or-later
{
  network = "your-network-name",
  connector = {
    logLevel = "info",
    analyticsEnabled = true,
  },
  kubernetes = {
    namespace = "twingate-system",
    replicaCount = 2,
  },
  resources = {
    requests = {
      memory = "128Mi",
      cpu = "100m",
    },
    limits = {
      memory = "256Mi",
      cpu = "500m",
    },
  },
}
