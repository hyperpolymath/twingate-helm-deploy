# SPDX-License-Identifier: MPL-2.0
let base = import "./base.ncl" in
{
  network = base.network,
  connector = {
    logLevel = "info",
    analyticsEnabled = base.connector.analyticsEnabled,
  },
  kubernetes = {
    namespace = base.kubernetes.namespace,
    replicaCount = 1,
  },
  resources = base.resources,
}
