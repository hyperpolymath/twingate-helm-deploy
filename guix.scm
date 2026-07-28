; SPDX-License-Identifier: MPL-2.0
;; guix.scm — GNU Guix package definition for twingate-helm-deploy
;; Usage: guix shell -f guix.scm

(use-modules (guix packages)
             (guix build-system gnu)
             (guix licenses))

(package
  (name "twingate-helm-deploy")
  (version "0.1.0")
  (source #f)
  (build-system gnu-build-system)
  (synopsis "twingate-helm-deploy")
  (description "twingate-helm-deploy — part of the hyperpolymath ecosystem.")
  (home-page "https://github.com/hyperpolymath/twingate-helm-deploy")
  (license ((@@ (guix licenses) license) "PMPL-1.0-or-later"
             "https://github.com/hyperpolymath/palimpsest-license")))
