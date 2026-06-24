# SPDX-License-Identifier: MPL-2.0
# Justfile - Twingate Helm deployment automation

import? "contractile.just"

default:
    @just --list

# Deploy Twingate connector with specified environment
deploy ENV="production":
    #!/usr/bin/env bash
    set -euo pipefail
    values_file="$$(mktemp)"
    trap 'rm -f "$$values_file"' EXIT
    nickel export --format yaml "configs/{{ENV}}.ncl" > "$$values_file"
    helm upgrade --install twingate-connector ./charts/twingate-connector \
        --namespace twingate-system --create-namespace \
        --values "$$values_file"
    echo "✓ Deployment complete"

# Remove Twingate deployment
undeploy:
    helm uninstall twingate-connector -n twingate-system || true
    @echo "✓ Cleanup complete"

# Create secret with Twingate credentials
configure-secrets:
    #!/usr/bin/env bash
    if [ -z "$TWINGATE_ACCESS_TOKEN" ] || [ -z "$TWINGATE_REFRESH_TOKEN" ]; then
        echo "Error: Set TWINGATE_ACCESS_TOKEN and TWINGATE_REFRESH_TOKEN"
        exit 1
    fi
    kubectl create namespace twingate-system --dry-run=client -o yaml | kubectl apply -f -
    kubectl create secret generic twingate-credentials \
        -n twingate-system \
        --from-literal=access-token="$TWINGATE_ACCESS_TOKEN" \
        --from-literal=refresh-token="$TWINGATE_REFRESH_TOKEN" \
        --dry-run=client -o yaml | kubectl apply -f -
    echo "✓ Secrets configured"

# Check deployment status
status:
    kubectl -n twingate-system get all

# Watch logs
logs:
    kubectl -n twingate-system logs -f -l app.kubernetes.io/name=twingate-connector

# Health check
health-check:
    kubectl -n twingate-system get pods -l app.kubernetes.io/name=twingate-connector

# Validate Helm chart
validate:
    helm lint charts/twingate-connector
    nickel typecheck configs/schema.ncl
    nickel typecheck configs/base.ncl
    nickel typecheck configs/staging.ncl
    nickel typecheck configs/production.ncl
    nickel export --format yaml configs/production.ncl > /dev/null
    @echo "✓ Chart validation passed"

# Clean up resources
clean:
    @just undeploy


# Run panic-attacker pre-commit scan
assail:
    @command -v panic-attack >/dev/null 2>&1 && panic-attack assail . || echo "panic-attack not found — install from https://github.com/hyperpolymath/panic-attacker"

# Self-diagnostic — checks dependencies, permissions, paths
doctor:
    @echo "Running diagnostics for twingate-helm-deploy..."
    @echo "Checking required tools..."
    @command -v just >/dev/null 2>&1 && echo "  [OK] just" || echo "  [FAIL] just not found"
    @command -v git >/dev/null 2>&1 && echo "  [OK] git" || echo "  [FAIL] git not found"
    @echo "Checking for hardcoded paths..."
    @grep -rn '$HOME\|$ECLIPSE_DIR' --include='*.rs' --include='*.ex' --include='*.res' --include='*.gleam' --include='*.sh' . 2>/dev/null | head -5 || echo "  [OK] No hardcoded paths"
    @echo "Diagnostics complete."

# Guided tour of key features
tour:
    @echo "=== twingate-helm-deploy Tour ==="
    @echo ""
    @echo "1. Project structure:"
    @ls -la
    @echo ""
    @echo "2. Available commands: just --list"
    @echo ""
    @echo "3. Read README.adoc for full overview"
    @echo "4. Read EXPLAINME.adoc for architecture decisions"
    @echo "5. Run 'just doctor' to check your setup"
    @echo ""
    @echo "Tour complete! Try 'just --list' to see all available commands."

# Open feedback channel with diagnostic context
help-me:
    @echo "=== twingate-helm-deploy Help ==="
    @echo "Platform: $(uname -s) $(uname -m)"
    @echo "Shell: $SHELL"
    @echo ""
    @echo "To report an issue:"
    @echo "  https://github.com/hyperpolymath/twingate-helm-deploy/issues/new"
    @echo ""
    @echo "Include the output of 'just doctor' in your report."

# Attempt to automatically install missing tools
heal:
    #!/usr/bin/env bash
    echo "═══════════════════════════════════════════════════"
    echo "  Twingate Helm Deploy Heal — Automatic Tool Installation"
    echo "═══════════════════════════════════════════════════"
    echo ""
if ! command -v just >/dev/null 2>&1; then
    echo "Installing just..."
    cargo install just 2>/dev/null || echo "Install just from https://just.systems"
fi
    echo ""
    echo "Heal complete. Run 'just doctor' to verify."


# Print the current CRG grade (reads from READINESS.md '**Current Grade:** X' line)
crg-grade:
    @grade=$$(grep -oP '(?<=\*\*Current Grade:\*\* )[A-FX]' READINESS.md 2>/dev/null | head -1); \
    [ -z "$$grade" ] && grade="X"; \
    echo "$$grade"

# Generate a shields.io badge markdown for the current CRG grade
# Looks for '**Current Grade:** X' in READINESS.md; falls back to X
crg-badge:
    @grade=$$(grep -oP '(?<=\*\*Current Grade:\*\* )[A-FX]' READINESS.md 2>/dev/null | head -1); \
    [ -z "$$grade" ] && grade="X"; \
    case "$$grade" in \
      A) color="brightgreen" ;; B) color="green" ;; C) color="yellow" ;; \
      D) color="orange" ;; E) color="red" ;; F) color="critical" ;; \
      *) color="lightgrey" ;; esac; \
    echo "[![CRG $$grade](https://img.shields.io/badge/CRG-$$grade-$$color?style=flat-square)](https://github.com/hyperpolymath/standards/tree/main/component-readiness-grades)"

secret-scan-trufflehog:
    @command -v trufflehog >/dev/null && trufflehog filesystem . --only-verified || true
