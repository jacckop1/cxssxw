# Changelog

## 1.1.1

- Fixed GitHub Actions `Permission denied` when scripts are uploaded through the GitHub web interface or Windows.
- The workflow now restores script permissions and invokes the build script explicitly with Bash.
- The build script invokes source validation with Bash, so nested scripts do not depend on executable file mode.
- Added `.gitattributes` to keep shell scripts on LF line endings.

## 1.1.0

- Converted the source from a Logos-style tweak target to a standalone Theos library target.
- Renamed the entry source from `Tweak.xm` to `KiraEntry.m`.
- Added a GitHub Actions macOS build workflow.
- Added automatic ad-hoc signing and architecture verification.
- Added a linked-library check that rejects Substrate, Substitute, and libhooker dependencies.
- Added ready-to-inject ZIP and SHA-256 output generation.
- Added source validation for accidental networking, licensing, or Logos code.
