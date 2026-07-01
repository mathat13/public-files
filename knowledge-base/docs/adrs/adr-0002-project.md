# ADR-0002: project.md

## Status
Proposed | In-Progress | Accepted

## Context

As projects grow, knowledge becomes distributed across ADRs, diagrams, reflections, implementation repositories, and generated projections. Without a canonical entry point, understanding a project requires traversing multiple artifacts.

## Decision

Each project shall contain a project.md file that acts as the canonical semantic representation of the project. It captures the project's intent, reasoning, current state, and links to supporting artifacts such as ADRs, diagrams, reflections, and implementation repositories.

## Consequences

### Positive

- Establishes a single canonical entry point for understanding a project.
- Separates high-level reasoning from detailed documentation.
- Supports multiple projections (CVs, portfolios, diagrams, interview material) from a shared representation.
- Enables automated tooling to discover project structure consistently.

### Negative

- We will have to be careful to not over-populate the file, as this may lead to the same problem as this file is intended to solve
- 

## Alternatives Considered

