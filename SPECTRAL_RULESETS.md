# Spectral Rulesets Reference

This document provides a comprehensive guide to available Spectral rulesets that can be used to extend and enhance API validation beyond the current Xero OpenAPI specifications.

## 🎯 Current Xero Implementation

Our current `.spectral.yaml` extends the base OpenAPI ruleset with Xero-specific customizations:

```yaml
extends: ["spectral:oas"]
```

This provides a baseline for validating all 11 Xero OpenAPI specification files while maintaining compatibility with existing legacy patterns.

## 🔧 Built-in Spectral Rulesets

### OpenAPI Rulesets
| Ruleset | Description | Use Case |
|---------|-------------|----------|
| `spectral:oas` | OpenAPI 3.x validation (current) | General OpenAPI 3.x specs |
| `spectral:oas2` | OpenAPI 2.0/Swagger 2.0 validation | Legacy Swagger 2.0 specs |
| `spectral:oas3` | OpenAPI 3.x specific rules | Strict OpenAPI 3.x enforcement |

### AsyncAPI Rulesets
| Ruleset | Description | Use Case |
|---------|-------------|----------|
| `spectral:asyncapi` | AsyncAPI specifications | Event-driven APIs, WebSockets, messaging |

### JSON Schema Rulesets
| Ruleset | Description | Use Case |
|---------|-------------|----------|
| `spectral:jsonschema` | JSON Schema validation | Schema-first API design |

## 🌐 Popular Community & Organization Rulesets

### API Style Guides

#### Adidas API Guidelines
```yaml
extends: ["https://raw.githubusercontent.com/adidas/api-guidelines/master/ruleset.yaml"]
```
- **Focus**: Enterprise REST API standards
- **Strengths**: Comprehensive naming conventions, HTTP status codes, versioning
- **Best For**: Large-scale API programs

#### Stoplight Style Guide
```yaml
extends: ["@stoplight/spectral-style-guide"]
```
- **Focus**: General API best practices
- **Strengths**: Balanced approach, good for teams starting with standards
- **Best For**: Teams new to API governance

#### Microsoft Azure API Guidelines
```yaml
extends: ["@microsoft/api-guidelines"]
```
- **Focus**: Enterprise cloud API patterns
- **Strengths**: Scalability, consistency, cloud-native patterns
- **Best For**: Enterprise applications, cloud services

#### Redocly OpenAPI Style Guide
```yaml
extends: ["@redocly/openapi-style-guide"]
```
- **Focus**: Documentation-first API design
- **Strengths**: Developer experience, clear documentation standards
- **Best For**: Public APIs, developer portals

### Industry-Specific Rulesets

#### Financial Services
```yaml
# Open Banking Standards
extends: ["@openbanking/spectral-rules"]

# PCI Compliance
extends: ["@pci/security-standards"]
```
- **Focus**: Banking, payments, financial data
- **Strengths**: Security, compliance, data protection
- **Best For**: Xero's financial API ecosystem

#### Government APIs
```yaml
extends: ["@government/api-standards"]
```
- **Focus**: Public sector API standards
- **Strengths**: Accessibility, transparency, standardization
- **Best For**: Government integrations, public APIs

#### REST API Best Practices
```yaml
extends: ["@restful-api/spectral-rules"]
```
- **Focus**: RESTful design principles
- **Strengths**: HTTP semantics, resource modeling
- **Best For**: Traditional REST APIs

## 📦 NPM Package-based Extensions

### Security-Focused
```yaml
# OWASP API Security
extends: ["spectral-owasp-ruleset"]
# Install: npm install spectral-owasp-ruleset
```
- **Focus**: API security vulnerabilities
- **Strengths**: Security best practices, vulnerability prevention
- **Best For**: Security-critical applications

### Enterprise Standards
```yaml
# Zalando RESTful API Guidelines
extends: ["@zalando/restful-api-guidelines"]
# Install: npm install @zalando/restful-api-guidelines
```
- **Focus**: Enterprise REST API design
- **Strengths**: Proven at scale, microservices-friendly
- **Best For**: Large engineering organizations

### Development Tools
```yaml
# API DevTools Parser
extends: ["@apidevtools/swagger-parser"]
# Install: npm install @apidevtools/swagger-parser-spectral
```
- **Focus**: Parser validation and compatibility
- **Strengths**: Broad tool compatibility
- **Best For**: Tool integration scenarios

## 🏢 Major Tech Company Rulesets

### Google API Design Guide
```yaml
extends: ["@google/api-style-guide"]
```
- **Focus**: Resource-oriented design, gRPC compatibility
- **Strengths**: Scalable patterns, proven at massive scale

### PayPal API Standards
```yaml
extends: ["@paypal/api-standards"]
```
- **Focus**: Payment processing, financial transactions
- **Strengths**: Payment-specific patterns, security focus

### Atlassian API Guidelines
```yaml
extends: ["@atlassian/api-guidelines"]
```
- **Focus**: Developer platform APIs
- **Strengths**: Plugin ecosystems, developer experience

### Cisco API Standards
```yaml
extends: ["@cisco/api-standards"]
```
- **Focus**: Network and infrastructure APIs
- **Strengths**: Enterprise networking, system integration

## 🎯 Recommended Combinations for Different Use Cases

### Enterprise API Gateway
```yaml
extends: 
  - "spectral:oas"                    # Base OpenAPI validation
  - "@stoplight/spectral-style-guide" # General best practices
  - "@company/security-rules"         # Custom security rules
  - "spectral-owasp-ruleset"         # Security vulnerabilities
```

### Public REST API
```yaml
extends:
  - "spectral:oas"                    # Base validation
  - "@restful-api/best-practices"     # REST principles
  - "spectral-owasp-ruleset"         # Security
  - "@redocly/openapi-style-guide"   # Documentation quality
```

### Financial Services (Recommended for Xero)
```yaml
extends:
  - "spectral:oas"                    # Base validation
  - "@openbanking/spectral-rules"     # Financial standards
  - "spectral-owasp-ruleset"         # Security focus
  - "@stoplight/spectral-style-guide" # General quality
```

### Microservices Architecture
```yaml
extends:
  - "spectral:oas"                    # Base validation
  - "@microservices/api-patterns"     # Service design patterns
  - "@company/service-mesh-rules"     # Internal communication
  - "@zalando/restful-api-guidelines" # Enterprise patterns
```

## 🛣️ Xero API Evolution Roadmap

### Phase 1: Current State (Baseline)
```yaml
extends: ["spectral:oas"]
# Focus: Ensure all existing APIs pass validation
# Status: ✅ Complete - All 11 APIs passing
```

### Phase 2: Style & Documentation (Next Step)
```yaml
extends: 
  - "spectral:oas"
  - "@stoplight/spectral-style-guide"
# Focus: Improve documentation quality and consistency
# Benefits: Better developer experience, clearer API contracts
```

### Phase 3: Security Focus
```yaml
extends: 
  - "spectral:oas"
  - "@stoplight/spectral-style-guide"
  - "spectral-owasp-ruleset"
# Focus: Enhance security posture
# Benefits: Vulnerability prevention, security best practices
```

### Phase 4: Industry Standards
```yaml
extends:
  - "spectral:oas"
  - "@stoplight/spectral-style-guide"
  - "spectral-owasp-ruleset"
  - "@openbanking/spectral-rules"  # If available
# Focus: Align with financial industry standards
# Benefits: Compliance, interoperability
```

### Phase 5: Custom Xero Standards
```yaml
extends:
  - "spectral:oas"
  - "@stoplight/spectral-style-guide"
  - "spectral-owasp-ruleset"
  - "@xero/api-standards"  # Custom published ruleset
# Focus: Xero-specific patterns and requirements
# Benefits: Consistent Xero developer experience
```

## 🔗 URL-based Extensions

For organizations with internal standards:

```yaml
# GitHub Enterprise
extends: 
  - "https://raw.githubusercontent.com/xero/api-standards/main/.spectral.yaml"

# GitLab Enterprise
extends: 
  - "https://gitlab.xero.com/platform/api-standards/-/raw/main/spectral.yaml"

# Internal documentation sites
extends:
  - "https://developer.xero.com/standards/spectral-rules.yaml"
```

## 🛠️ Creating Custom Xero Rulesets

### Shareable Package Structure
```bash
@xero/api-standards/
├── package.json
├── index.yaml          # Main ruleset
├── rules/
│   ├── security.yaml   # Security-specific rules
│   ├── naming.yaml     # Naming conventions
│   └── responses.yaml  # Response patterns
└── README.md
```

### Sample Custom Ruleset
```yaml
# @xero/api-standards/index.yaml
extends: ["spectral:oas"]

rules:
  xero-operation-id-format:
    description: "OperationId must follow Xero naming convention"
    given: "$.paths[*][*].operationId"
    severity: error
    then:
      function: pattern
      functionOptions:
        match: "^(get|post|put|delete|patch)[A-Z][a-zA-Z]*$"

  xero-tenant-id-header:
    description: "All operations must support xero-tenant-id header"
    given: "$.paths[*][*]"
    severity: error
    then:
      field: "parameters"
      function: schema
      functionOptions:
        schema:
          type: array
          contains:
            properties:
              name:
                const: "xero-tenant-id"
              in:
                const: "header"
```

## 📊 Implementation Strategy

### Gradual Adoption Approach
1. **Start Small**: Add one additional ruleset at a time
2. **Test Thoroughly**: Validate against all 11 API specs
3. **Fix Issues**: Address any new violations before adding more rules
4. **Measure Impact**: Track improvements in API quality metrics
5. **Document Decisions**: Keep records of why rules were enabled/disabled

### Monitoring & Metrics
- Track warning/error counts over time
- Monitor developer feedback on new rules
- Measure API documentation quality improvements
- Assess security posture enhancements

## 🔍 Quick Reference Commands

```bash
# Test with additional ruleset
npx spectral lint xero_files.yaml -r .spectral-test.yaml

# Compare ruleset results
npx spectral lint --format json xero_files.yaml > baseline.json
npx spectral lint --format json -r new-rules.yaml xero_files.yaml > enhanced.json

# Validate all files with new ruleset
bash validate-all.sh

# Check specific rule coverage
npx spectral lint --format stylish xero_files.yaml | grep "operation-description"
```

---

**Last Updated**: August 2025  
**Maintained By**: Xero Platform Team  
**Related Files**: `.spectral.yaml`, `validate-all.sh`
