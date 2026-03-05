# SPDX-License-Identifier: PMPL-1.0-or-later
# Justfile - Twingate Helm deployment automation

default:
    @just --list

# Deploy Twingate connector with specified environment
deploy ENV="production":
    helm upgrade --install twingate-connector ./charts/twingate-connector \
        --namespace twingate-system --create-namespace \
        --values configs/{{ENV}}.ncl
    @echo "✓ Deployment complete"

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
    @echo "✓ Chart validation passed"

# Clean up resources
clean:
    @just undeploy


# [AUTO-GENERATED] Multi-arch / RISC-V target
build-riscv:
	@echo "Building for RISC-V..."
	cross build --target riscv64gc-unknown-linux-gnu
