# Knowledge Base Design Notes — Summary

## Core Realization

The knowledge base is no longer simply a repository of project documentation.

It has evolved into a reasoning system whose purpose is to improve future engineering by preserving the evolution of thought from initial intent to final reflection.

The primary goal is therefore not to document software, but to preserve and communicate engineering reasoning.

---

# Project Lifecycle

Projects are organized around phases of reasoning rather than document types.

```text
Project
│
├── Intent
├── Design
│   ├── Worksheets
│   ├── ADRs
│   └── Diagrams
├── Implementation
│   ├── Worksheets
│   ├── ADRs
│   └── Diagrams
├── Reflections
└── project.md
```

Each phase represents a distinct stage of engineering thought.

* Intent captures motivation and desired outcomes.
* Design captures prospective reasoning.
* Implementation captures reasoning discovered during construction.
* Reflection captures hindsight and lessons learned.

---

# Worksheets

Worksheets are exploratory artifacts.

They are intentionally unstructured and optimized for reasoning rather than documentation.

Their purpose is to externalize thinking and reduce cognitive load during exploration.

A worksheet typically begins with a question.

Example:

* Question
* Context
* Candidate Solutions
* Reasoning
* Observations
* Decision

The worksheet is the place where alternatives are explored and engineering judgment develops.

The ADR is merely a distilled representation of this reasoning.

---

# ADRs

An ADR records a committed architectural decision.

It should contain enough rationale to stand on its own, but should not attempt to reproduce the worksheet.

Relationship:

```text
Worksheet
        ↓
Reasoning
        ↓
Distillation
        ↓
ADR
```

The worksheet preserves exploration.

The ADR preserves commitment.

---

# Repository vs Knowledge Base

Repository documentation and knowledge base documentation serve different purposes.

Repository documentation answers:

* How does the system work today?
* How should it be maintained?
* How is it deployed?

Knowledge base documentation answers:

* Why was it built?
* Why were decisions made?
* How did reasoning evolve?
* What was learned?

The repository owns implementation truth.

The knowledge base owns reasoning truth.

---

# Diagrams

A diagram is not simply a picture of a system.

A diagram is an answer to a question.

Every diagram should have a clearly defined purpose before it is drawn.

Suggested metadata:

* Audience
* Purpose
* Questions Answered
* Level of Abstraction

Design should begin by defining these questions before any boxes or arrows are drawn.

---

# Diagram Worksheets

Diagram design should follow the same process as ADR design.

Rather than immediately drawing a diagram:

1. Create a worksheet.
2. Define the audience.
3. Define the purpose.
4. Define the questions the diagram should answer.
5. Explore which concepts belong in the diagram.
6. Remove concepts that do not help answer those questions.
7. Draw the final diagram.

The completed metadata becomes a natural stopping point before implementation, allowing relationships between diagrams to be planned before any drawing begins.

---

# Progressive Abstraction

Every artifact represents a compression of the previous one.

```text
Exploration
    ↓
Worksheet
    ↓
ADR
    ↓
project.md
    ↓
Projection (CV, Portfolio, Interview)
```

Likewise for diagrams:

```text
Question
    ↓
Diagram
    ↓
Understanding
```

Each layer preserves the important invariants while discarding unnecessary detail.

---

# Diagram Design Principles

During today's DDNS work several principles emerged:

* One diagram should answer one primary question.
* Omitted details are intentional abstractions.
* Introduce concepts once and reuse them across diagrams.
* Use consistent naming between diagrams.
* Preserve the reader's mental model rather than implementation details.

Examples:

* Context diagram: "Where does the system exist?"
* Sequence diagram: "How does the system behave?"
* Component diagram: "How is the software organized internally?"

These diagrams complement one another rather than duplicate information.

---

# C4

C4 provides an established hierarchy of abstraction:

* System Context
* Container
* Component
* Code

Sequence diagrams naturally complement these layers rather than replacing them.

PlantUML provides mature support for C4 while remaining text-based and version-control friendly, making it a good fit for this knowledge base.

---

# Emerging Philosophy

Throughout today's work a consistent philosophy emerged.

Rather than asking:

> What documentation should I write?

The better question is:

> What understanding am I trying to create?

Every artifact—worksheets, ADRs, diagrams, project summaries, reflections, and future projections—exists to answer a specific question for a specific audience at a specific level of abstraction.

The knowledge base therefore becomes a system for preserving, improving, and communicating engineering reasoning rather than simply recording completed software.
