# Knowledge Base Design Notes — Summary (Part 2)

## C4 and Progressive Abstraction

A major realization was that C4 is not simply a diagramming standard, but a structured method of communicating software at progressively deeper levels of abstraction.

Rather than attempting to explain everything in a single diagram, each diagram answers a different question.

Typical progression:

```text
System Context
    ↓
Container
    ↓
Component
    ↓
Code
```

Sequence diagrams naturally complement C4 by answering behavioural questions rather than structural ones.

This aligns directly with the existing knowledge base philosophy:

> One artifact should answer one primary question.

---

# Diagram Pairing

The DDNS project now contains two complementary diagrams.

## Context / Deployment

Answers:

* Where does the system exist?
* What external systems does it depend on?

This diagram intentionally omits implementation details such as Docker networking and routers because they do not contribute to the understanding being communicated.

## Sequence

Answers:

* What does the service do?
* How does a typical execution proceed?

The sequence diagram explains:

* Public IP retrieval
* Comparison against cached value
* Conditional DNS update
* Continue monitoring

Together these diagrams create a shared mental model without unnecessary overlap.

---

# Intentional Abstraction

One of the strongest principles established was:

> Omitted details are intentional abstractions.

A diagram should preserve only the concepts necessary to answer its intended question.

Accuracy is not the objective.

Understanding is.

The important architectural truth is preserved while implementation detail is deliberately omitted.

---

# Consistent Vocabulary

Concept names should remain consistent across all diagrams.

Example:

* DDNS Service
* Public IP Service
* Cloudflare API

Once introduced, these concepts should be reused rather than renamed.

This reduces cognitive load and allows diagrams to reinforce one another.

---

# Diagram Metadata

Every diagram should begin with metadata before implementation.

Suggested metadata:

* Audience
* Purpose
* Questions Answered
* Level of Abstraction

This forces the designer to define the communication objective before drawing.

The metadata also provides natural stopping points for planning an entire collection of diagrams before implementing any of them.

---

# Diagram Worksheets

Diagrams should follow the same workflow as ADRs.

Rather than beginning with PlantUML:

1. Create a worksheet.
2. Define the audience.
3. Define the purpose.
4. Define the questions.
5. Explore candidate concepts.
6. Remove concepts that do not contribute.
7. Draw the diagram.

The worksheet therefore supports both reasoning and metadata generation.

---

# Diagram Notation

Diagram notation should itself become an artifact.

Rather than embedding legends into every diagram, notation can be documented separately and referenced consistently.

Current notation includes concepts such as:

* External System
* Infrastructure
* Software
* Dependency

This notation remains provisional until sufficient experience has been gained using C4.

---

# PlantUML

PlantUML was selected as the current diagramming solution because it supports:

* Version control
* Text-based editing
* Automation
* Mature sequence diagrams
* Mature C4 support

Alternative tools remain valuable, but there is currently insufficient benefit to justify changing the knowledge base tooling.

This decision should be reviewed after practical experience with C4.

---

# Enterprise Architecture

The transcoding application introduced additional modelling requirements.

Future diagram types may include:

* C4 Context
* C4 Container
* C4 Component
* Context Maps
* Aggregate Lifecycle
* State Diagrams
* Sequence Diagrams

These should not replace one another.

Each exists because it answers a different architectural question.

---

# Interview Strategy

Not every artifact provides equal value.

Current priority order:

1. Intent
2. Context Diagram
3. Sequence Diagram
4. Container Diagram
5. ADRs
6. Additional technical diagrams

This maximizes understanding per hour invested.

---

# Intent

Intent became recognized as one of the highest-value artifacts for management-oriented discussions.

Its purpose is to answer:

> Why should this project exist?

Current structure:

* Problem
* Constraints
* Motivation
* Vision
* Target Audience
* Idea

Intent captures stable reasoning before design begins.

Implementation details intentionally remain absent.

---

# Storytelling

Intent is not simply documentation.

It forms the narrative foundation of the project.

Example flow:

Problem

↓

Motivation

↓

Constraints

↓

Vision

↓

Idea

This narrative naturally compresses into project.md and subsequently into CV bullets or interview responses.

Artifacts support the story.

The engineer tells the story.

---

# Stable vs Unstable Information

Intent should remain relatively stable.

Changing:

* programming language
* container runtime
* logging framework

should not affect Intent.

This demonstrates that Intent captures architectural reasoning rather than implementation.

---

# Decision Weight

Another important principle emerged:

Not every decision deserves an ADR.

Decision significance should guide documentation effort.

Questions to ask:

* Is this reasoning likely to remain valuable?
* Would understanding this decision matter six months from now?
* Does this decision influence future work?

Only sufficiently important decisions justify formal architectural records.

---

# Documentation Investment

Reasoning effort should be proportional to expected long-term value.

Examples of high-value decisions:

* Knowledge base philosophy
* Repository responsibilities
* Project organization
* Diagram conventions
* Diagram tooling

Low-impact implementation details should not consume significant documentation effort.

---

# Engineering Process

The knowledge base is increasingly becoming an engineering workflow rather than a documentation repository.

Current process:

Question

↓

Worksheet

↓

Metadata

↓

Artifact

↓

Compression

↓

Projection

Artifacts are now generated from reasoning rather than existing independently.

---

# Learning Architecture

A project is no longer viewed as a collection of files.

Instead it becomes a guided learning experience.

Understanding progresses naturally:

Intent

↓

High-level diagrams

↓

Behaviour

↓

Architecture

↓

Design decisions

↓

Implementation

↓

Reflection

Every artifact exists because it answers the next question someone naturally asks.

---

# Current DDNS Status

The DDNS project now possesses a coherent narrative.

Intent explains:

* why the project exists

Context diagram explains:

* where it exists

Sequence diagram explains:

* what it does

Future component diagrams can explain:

* how it is internally organized

The project is now approaching an interview-ready state while remaining extensible for future architectural documentation.
