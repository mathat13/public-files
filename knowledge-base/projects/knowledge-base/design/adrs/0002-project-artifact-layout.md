# ADR-0002: Project Artifact Organization

## Dependencies

- ADR-0001: Knowledge Base Artifact Organization

## Context

We have our knowledge base organized by projects, but project artifacts can also be organized optimally, how should we organize project artifacts to best balance all the factors present?

## Decision

We will organize projects by phase of engineering reasoning:

```
project/
    intent/
    design/
    implementation/
    reflections/
```

Representing the progression from motivation through implementation to learning.

## Consequences

### Positive

- Easy to understand as it naturally reflects how a project is created from start to finish
- Scales well
- Supports future automation

### Negative

- Will require docs to justify and explain structure
- More complex than a flat structure, meaning more work initially

## Alternatives Considered

- Organize by artifact:

```
project/
    adrs/
    diagrams/
    worksheets/
    reflections/
```

- Flat structure:

```
project/
    project.md
    adr-0001.md
    adr-0002.md
    diagram-001.drawio
    worksheet-001.md
```

- Organize by concern (phase of building):

```
project/
    architecture/
    implementation/
    communication/
```