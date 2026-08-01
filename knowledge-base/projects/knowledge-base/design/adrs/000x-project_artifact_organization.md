# ADR-000x: Project Artifact Organization

## Context

We have decided to organize our knowledge base by projects, but project artifacts can also be organized optimally, how should we organize project artifacts to best reflect the process of understanding a project?

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

We will also include a reasoning folder, for artifacts that are cross-cutting across the phases of engineering reasoning.

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
---