# SPDX-License-Identifier: MPL-2.0
let base = import "./base.ncl" in
{
  network = base.network,
  connector = {
    logLevel = "warn",
    analyticsEnabled = base.connector.analyticsEnabled,
  },
  kubernetes = {
    namespace = base.kubernetes.namespace,
    replicaCount = 3,
  },
  resources = base.resources,
}
