# ADR-000x: Responsibility between Knowledge Base and Repository

## Question

What are the responsibilities of the Knowledge Base and Repository?

## Context

The problem with traditional repos is that it is currently tasked with representing the current implementation of a system and the way it got there (through adr chains, digram evolution, etc). We have introduced a knowledge base as a component that aims to synergize with a repo to show a more complete picture of how an engineer has implemented a problem.  If we separate responsibilities like so:
- Fully represent current state of system
- Show the evolution of the system

What is the best split of responsibility between the knowledge base and repo for best results?

## Decision

We will split responsibility between the knowledge base and repository like so:
- Repository contains all artifacts related to current implementation of system
- Knowledge base contains all artifacts related to engineering understanding

## Consequences

### Positive
- Repository will have less responsibility, and so will be easier to understand
- Knowledge base has responsibility, but doesn't over-reach
- Allows for richer observability of engineering reasoning in knowledge base

### Negative
- Potential drift between shared kb/ repo artifacts
- More complex to maintain

## Alternatives considered
- Repository-centric
- Knowledge-base-centric
- Duplication/ shared responsibility across components