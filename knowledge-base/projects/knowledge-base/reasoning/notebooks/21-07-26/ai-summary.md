# AI Summary (Since 20-07-26)

## Repository vs Knowledge Base

A key clarification was made regarding the repository.

Previously, the repository had implicitly been viewed as only its documentation. Instead, the repository should be considered holistically as the complete implementation, including:

- Source code
- Tests
- Configuration
- Build scripts
- Documentation

This led to a distinction between executable implementation and engineering knowledge.

The repository is authoritative for executable implementation, while the knowledge base is authoritative for engineering understanding.

Repository documentation may be generated from the knowledge base without becoming the authoritative source.

---

## Authority Rather Than Storage

The original architectural question:

> How should engineering knowledge be partitioned between the knowledge base and the implementation repository?

was abstracted into a more fundamental question:

> What is the authoritative source for each kind of engineering information?

This shifted the discussion away from storage locations and towards ownership of engineering information.

Several alternative architectural philosophies were explored, including:

- Repository-centric authority
- Knowledge-base-centric authority
- Shared authority
- Domain-specific authority

The preferred direction became assigning exactly one authoritative owner to each kind of engineering information.

---

## Foundational and Derived ADRs

A distinction emerged between foundational and derived ADRs.

Rather than existing independently, ADRs appear to form a dependency graph.

Foundational ADRs establish architectural principles that constrain future decision spaces.

Derived ADRs inherit assumptions from foundational ADRs, naturally reducing the number of reasonable alternatives that need to be considered.

This suggests an architectural methodology of:

Problem

↓

Worksheet

↓

Abstract the question

↓

Foundational ADR

↓

Derived ADRs

---

## Information Types

A new foundational classification was identified before assigning authority.

Rather than immediately deciding ownership, the engineering information itself should first be classified.

The current information types are:

- Implementation
- Models
- Reasoning
- Decisions
- Representations

This classification provides vocabulary for later ADRs rather than architectural decisions themselves.

---

## Classification as a First-Class Artifact

It became apparent that classifications are fundamentally different from ADRs.

Unlike ADRs, classifications are not based on competing alternatives.

Instead, they establish shared terminology used throughout the knowledge base.

A new top-level classification area was proposed containing concepts such as:

- Engineering Information Types
- Engineering Phases
- Engineering Dimensions
- Artifact Types

These provide central reference material rather than requiring concepts to be discovered by reading ADRs.

---

## Information Types vs Engineering Phases

A previously unresolved issue concerning workbook and thought log placement was resolved.

Engineering phases describe *when* work occurs.

Information types describe *what* kind of information exists.

These are independent dimensions.

Examples:

- Thought Logs belong to Reasoning regardless of engineering phase.
- Worksheets belong to Reasoning and may appear during Intent, Design, Implementation or Validation.

This removes the need to force artifacts into a single engineering phase.

---

## Artifact Types

A distinction emerged between information types and artifact types.

Information types describe conceptual categories.

Artifact types describe concrete engineering artifacts.

Examples of artifact types include:

- Thought Log
- Worksheet
- ADR
- README

These are implementations of information types rather than information types themselves.

This suggests Artifact Types should become a separate classification.

---

## Stability Hierarchy

The knowledge base appears to contain artifacts with different rates of change.

A possible hierarchy emerged:

Engineering Information Types

↓

Artifact Types

↓

Artifact Templates

↓

Individual Artifacts

The more fundamental an artifact is to the engineering language, the less frequently it should change.

---

## Principles

A new artifact type emerged naturally during discussion.

Initially principles were considered possible inputs to ADRs.

Later it became apparent that principles instead emerge from accepted ADRs.

The relationship became:

Classification

↓

ADRs

↓

Principles

Rather than being invented, principles are observations that consistently hold across multiple ADRs.

Examples include ideas such as:

- Every engineering information type has exactly one authoritative owner.
- Representations are derived from authoritative information.

Principles therefore have no exploration of alternatives.

Instead, they summarise recurring architectural truths.

Future ADRs may then use these principles to constrain their own solution spaces.

---

## Traceability

Principles may reference the ADRs from which they emerged.

Example:

Principle

↓

Supported by:

- ADR-0004
- ADR-0007
- ADR-0012

This provides architectural traceability while allowing principles to act as high-level summaries of the system.

---

## Emerging Knowledge Base Methodology

The discussion suggested an overall methodology for engineering knowledge:

Classification

↓

Thought Logs

↓

Worksheets

↓

Foundational ADRs

↓

Derived ADRs

↓

Principles

Each artifact has a distinct responsibility:

- Classification defines vocabulary.
- Thought Logs capture ideas.
- Worksheets explore questions.
- ADRs record decisions.
- Principles summarise recurring architectural truths.

Together these create a traceable progression from ideas to stable architectural knowledge.