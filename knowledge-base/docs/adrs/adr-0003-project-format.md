# ADR-0003: project.md Structure

## Status
Proposed | In-Progress | Accepted

## Context

Our project.md has been accepted as a centralized representation of reasoning for a project, but what should we include in this file to fully represent reasoning from initial design to implementation, and back towards understanding?

## Decision

We shall take the source of a project as intent, modelled like so:

Intent
├── Motivation
├── Problem
├── Vision
├── Constraints
└── Idea

Next we design an implementation of our idea with decisions:

Design
├── ADR index
└── Diagram index

Our actual implementation can then be linked:

Implementation
└── Link

And finally, we can include our reflections:

Reflection
├── Lessons
└── Reasoning Evolution

Which gives us a final project.md structure of:

Intent
├── Motivation
├── Problem
├── Vision
├── Constraints
└── Idea
Design
├── ADR index
└── Diagram index
Implementation
├── ADR index
├── Diagram index
└── Repo
Reflection
├── Lessons
└── Reasoning Evolution

## Consequences

### Positive

- We can now see a compressed representation of reasoning from initial intent to final reflections, expressing understanding, and can follow links for further information.
- We will no longer need to check over various decentralized artifacts to understand how a system was designed/ implemented
- Automation becomes simpler as our project.md provides hooks to further artifacts to allow further understanding

### Negative



## Alternatives Considered

