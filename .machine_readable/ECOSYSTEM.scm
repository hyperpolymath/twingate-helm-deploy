;; SPDX-License-Identifier: PMPL-1.0-or-later
(ecosystem (metadata (version "0.2.0") (last-updated "2026-02-08"))
  (project (name "twingate-helm-deploy") (purpose "Twingate zero-trust connector Helm deployment") (role access-gateway))
  (flatracoon-integration
    (parent "flatracoon/netstack")
    (layer access)
    (depended-on-by ())
    (depends-on ())))
