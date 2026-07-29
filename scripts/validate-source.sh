#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

required=(
  Makefile
  KiraEntry.m
  KiraRuntime.m
  KiraSettingsViewController.m
  KiraLockManager.m
  KiraGalleryCoordinator.m
  KiraUtilities.m
  KiraLocket.plist
)

for file in "${required[@]}"; do
  [[ -f "$file" ]] || { echo "Missing required file: $file" >&2; exit 1; }
done

# The clean-room project is intentionally local-only. Fail CI if networking or
# known licensing-server strings are accidentally introduced.
if grep -RInE --include='*.m' --include='*.h' \
  'NSURLSession|NSURLConnection|CFNetwork|sat-dev\.com|sat-vip\.com|performLoginCheck|cert_number|expiration_date' .; then
  echo "Unexpected networking or licensing-related code detected." >&2
  exit 1
fi

# The standalone dylib uses Objective-C runtime APIs directly and must not
# include Logos directives or Substrate headers.
if grep -RInE --include='*.m' --include='*.h' --include='*.xm' \
  '%hook|%ctor|%init|substrate\.h|CydiaSubstrate|MSHook' .; then
  echo "Unexpected Logos/Substrate dependency detected." >&2
  exit 1
fi

echo "Source validation passed."
