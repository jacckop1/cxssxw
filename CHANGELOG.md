# Changelog

## 1.1.0

- Converted the source from a Logos-style tweak target to a standalone Theos library target.
- Renamed the entry source from `Tweak.xm` to `KiraEntry.m`.
- Added a GitHub Actions macOS build workflow.
- Added automatic ad-hoc signing and architecture verification.
- Added a linked-library check that rejects Substrate, Substitute, and libhooker dependencies.
- Added ready-to-inject ZIP and SHA-256 output generation.
- Added source validation for accidental networking, licensing, or Logos code.
