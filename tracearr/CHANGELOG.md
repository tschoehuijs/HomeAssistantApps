# Changelog

## 3.1.1

# Tracearr v3.1.1

### Security
- The Docker images run Node 24.22.1, fixing the Node2Shell Brotli flaw (CVE-2026-111497)

### Notes
- Tracearr never decodes Brotli request bodies; only a configured server sending crafted responses could reach the flaw

Other release notes: https://github.com/connorgallopo/Tracearr/releases/tag/v3.1.0

