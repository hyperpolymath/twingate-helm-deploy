# SPDX-License-Identifier: PMPL-1.0-or-later
let base = import "./base.ncl" in
base & {
  connector.logLevel = "warn",
  kubernetes.replicaCount = 3,
}
