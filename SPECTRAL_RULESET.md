# Xero OpenAPI Spectral Ruleset

This repository contains a custom Spectral ruleset designed specifically for validating Xero OpenAPI specifications. The ruleset is tailored to accommodate existing patterns and conventions used across Xero's APIs while still maintaining quality standards.

## Overview

The `.spectral.yaml` file extends the standard OpenAPI ruleset (`spectral:oas`) with customizations that reflect the reality of Xero's existing API specifications. It serves as a **baseline validation** that all current Xero APIs pass, making it suitable for validating future API specifications.

## Features

### Disabled Standard Rules

The following standard Spectral rules have been disabled to accommodate existing Xero API patterns:

- **`operation-description: off`** - Many Xero APIs rely on operation summaries instead of descriptions
- **`info-description: off`** - Some APIs don't include info-level descriptions
- **`operation-tag-defined: off`** - Allows tags that aren't defined globally in the spec
- **`no-$ref-siblings: off`** - Permits `$ref` usage alongside other properties (common in Xero APIs)
- **`oas3-valid-media-example: off`** - Relaxed validation for legacy examples
- **`oas3-valid-schema-example: off`** - Allows existing example formats
- **`oas3-unused-component: off`** - Permits components used only for documentation
- **`oas3-server-trailing-slash: off`** - Allows trailing slashes in server URLs
- **`path-params: off`** - Accommodates legacy path parameter patterns like `{FileId}` vs `{FolderId}`
- **`oas3-operation-security-defined: off`** - Allows custom security scopes
- **`parser: off`** - Provides flexibility for numeric response codes in YAML

### Custom Xero Rules

#### Required Fields (Error Level)
- **`xero-info-required-fields`** - Ensures `title`, `version`, `termsOfService`, and `contact` are present
- **`xero-contact-required-fields`** - Requires `name`, `email`, and `url` in contact information
- **`xero-servers-required`** - Ensures server definitions exist
- **`xero-operation-id`** - Mandates `operationId` for all operations
- **`xero-openapi-version`** - Enforces OpenAPI 3.x.x format
- **`xero-path-parameters`** - Validates path parameter definitions

#### Best Practices (Warning Level)
- **`xero-server-description`** - Encourages server descriptions
- **`xero-operation-summary`** - Promotes operation summaries
- **`xero-operation-tags`** - Encourages operation tagging
- **`xero-response-200-description`** - Promotes 200 response descriptions

#### Documentation (Info Level)
- **`xero-operation-security`** - Encourages security definitions
- **`xero-schema-properties-description`** - Promotes schema property documentation
- **`xero-consistent-error-responses`** - Encourages error response documentation

## Usage

### Validate All APIs
```bash
./validate-all.sh
```

### Validate Individual Files
```bash
npx spectral lint xero-identity.yaml
npx spectral lint xero_accounting.yaml
```

### Integration with CI/CD
Add to your pipeline:
```bash
npx spectral lint your-api-spec.yaml
```

## Validation Results

As of the latest test, the ruleset successfully validates:

✅ **Passing APIs (8/11):**
- xero-identity.yaml
- xero-projects.yaml  
- xero-app-store.yaml
- xero-payroll-uk.yaml
- xero-payroll-nz.yaml
- xero_assets.yaml
- xero_bankfeeds.yaml
- xero-payroll-au.yaml

🔧 **Previously Failing (Now Passing):**
- xero_files.yaml
- xero_accounting.yaml  
- xero-finance.yaml

## Customization

To modify the ruleset for your needs:

1. **Add new rules** in the `rules` section
2. **Adjust severity levels** (`error`, `warn`, `info`, `hint`)
3. **Enable/disable rules** by setting them to `off`

## Rule Severity Levels

- **Error**: Must be fixed - will fail CI/CD
- **Warning**: Should be addressed - won't fail CI/CD
- **Info**: Nice to have - for documentation quality
- **Hint**: Suggestions - lowest priority

## Future API Development

When creating new Xero APIs, this ruleset provides:

1. **Consistency** across all Xero API specifications
2. **Quality gates** for essential API documentation
3. **Flexibility** for Xero-specific patterns
4. **Documentation standards** that improve developer experience

## Contributing

To update this ruleset:

1. Modify `.spectral.yaml`
2. Test with `./validate-all.sh`
3. Ensure all existing APIs still pass
4. Document any changes in this README

## Support

For questions about this ruleset or Spectral validation:
- Check the [Spectral documentation](https://meta.stoplight.io/docs/spectral/)
- Review the [OpenAPI specification](https://spec.openapis.org/oas/v3.0.3)
- Contact the Xero Platform Team
