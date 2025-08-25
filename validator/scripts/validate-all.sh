#!/bin/bash
#
# Run this script from root folder in the repository
#
# To validate a single file: npx spectral lint <filename>.yaml --ruleset <ruleset>
#

# Ruleset
ruleset="./validator/spectral.yaml"

# Run spectral and capture the exit code
if npx @stoplight/spectral-cli lint xero*.yaml --ruleset "$ruleset" --quiet > /dev/null 2>&1; then
    echo "✅ $file - PASSED"
    ((passed++))
else
    echo "❌ $file - FAILED"
    echo "   Running detailed check:"
    npx @stoplight/spectral-cli lint "$file" --ruleset "$ruleset" --format=stylish | head -10
    echo ""
    ((failed++))
fi

if [ $failed -eq 0 ]; then
    echo ""
    echo "🎉 ALL FILES PASSED! The Spectral ruleset is working correctly."
    echo "   This ruleset can be used as a baseline for validating future OpenAPI specs."
    exit 0
else
    echo ""
    echo "⚠️  Some files failed validation. Check the output above for details."
    exit 1
fi
