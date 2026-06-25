# ADR-0002: Knowledge Base Structure

## Status
Proposed | In-Progress | Accepted

## Context

Our knowledge base needs a way to structure information in an intelligent way to avoid future refactors.

## Decision

We will use this proposed structure:

knowledge_base/
    projects/
        project1/
            adrs/
            diagrams/
            project.md
    decisions/
    patterns/

Where decisions are a generalized form of ADRs, and patterns are a generalized form of decisions.  We will only implement the project directory to begin with, then define decisions when enough similar adrs have been made, and pattern when enough decisions have been made.

## Consequences

### Positive

- Allows us to break down projects into their most high-value components for projection early
- Makes future automation easier by forming relationships early

### Negative

- Deciding early means that we don't know what we need right now, so future refactoring of this ADR will potentially be necessary.

## Alternatives Considered

SQL database:
- 