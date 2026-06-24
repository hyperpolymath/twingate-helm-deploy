<!--
SPDX-License-Identifier: CC-BY-SA-4.0
Copyright (c) Jonathan D.A. Jewell <j.d.a.jewell@open.ac.uk>
-->
# TEST-NEEDS.md — twingate-helm-deploy

## CRG Grade: C — ACHIEVED 2026-04-04

## Current Test State

| Category | Count | Notes |
|----------|-------|-------|
| Zig FFI tests | 1 | `ffi/zig/test/integration_test.zig` |
| Test infrastructure | Present | `tests/` directory structure |

## What's Covered

- [x] Zig FFI integration tests
- [x] Test framework infrastructure

## Still Missing (for CRG B+)

- [ ] Helm chart validation tests
- [ ] Twingate connector tests
- [ ] Kubernetes deployment tests
- [ ] Network security property tests
- [ ] Performance benchmarks

## Run Tests

```bash
cd /var/mnt/eclipse/repos/twingate-helm-deploy && cargo test
```
