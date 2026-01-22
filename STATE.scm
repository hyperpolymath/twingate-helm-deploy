;; SPDX-License-Identifier: PMPL-1.0-or-later
;; STATE.scm - Current project state

(define project-state
  `((metadata
      ((version . "0.1.0")
       (schema-version . "1")
       (created . "2025-12-29T03:26:30+00:00")
       (updated . "2026-01-22T15:30:00+00:00")
       (project . "Twingate Helm Deploy")
       (repo . "twingate-helm-deploy")))
    (current-position
      ((phase . "mvp-complete")
       (overall-completion . 85)
       (working-features . (
         "Helm chart for Twingate Connector"
         "ConfigMap and Secret management"
         "Deployment with replica support"
         "NetworkPolicy for egress control"
         "Nickel configuration templates"
         "Just commands for deployment"
         "Health checks and monitoring support"
         "Example deployment guide"))))
    (route-to-mvp
      ((milestones
        ((v0.1 . ((items . (
          "✓ Helm chart structure (Chart.yaml, values.yaml)"
          "✓ K8s templates (deployment, serviceaccount, networkpolicy)"
          "✓ Nickel configs (base, production)"
          "✓ Justfile with deployment automation"
          "✓ Example documentation"
          "⧖ Live cluster testing"
          "⧖ Monitoring dashboards"))))))))
    (blockers-and-issues
      ((critical . ())
       (high . ())
       (medium . ("Needs Twingate account for testing"))
       (low . ())))
    (critical-next-actions
      ((immediate . ("Test on live cluster with Twingate account"))
       (this-week . ("Add Prometheus ServiceMonitor"))
       (this-month . ("Document ZeroTier integration"))))))
