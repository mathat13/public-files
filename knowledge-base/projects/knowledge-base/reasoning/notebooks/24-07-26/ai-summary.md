# AI Summary — 21-07-26 to 24-07-26

## Thought Logs Validated Through Use

Thought logs have now been used outside the original context in which they were conceived and have proven practically useful.

A lightweight routine emerged:

- Spend roughly 10 minutes at the beginning of a session reading the previous thought log.
- Use it to restore working context.
- Work normally.
- Spend roughly 10 minutes at the end recording thoughts that should persist.

This makes thought logs useful in two directions:

- Persisting mental context at the end of a session.
- Restoring mental context at the beginning of the next session.

This can be thought of as a form of serialization for working context.

Thought logs also capture transient observations that would not naturally belong in more formal artifacts, such as:

- Something feeling like the wrong abstraction.
- A relationship needing reconsideration.
- Two concepts potentially being the same thing.
- Questions that are not yet substantial enough to justify a worksheet.

This further validates the distinction between thought logs and worksheets:

- Thought logs capture thoughts cheaply as they occur.
- Worksheets deliberately investigate specific questions.

Session boundaries therefore become less destructive because working context can be cheaply persisted and restored.

---

## Engineering Lifecycle Classification

The existing engineering phases were refined and stripped down to definitions focused only on what distinguishes each phase.

The lifecycle became:

- **Intent:** Defines the problem, constraints, and proposed direction for solving it.
- **Design:** Defines the proposed architecture of the solution before concrete implementation.
- **Implementation:** Records how the design is realized and refined against implementation reality.
- **Reflection:** Evaluates the completed work to identify outcomes, lessons, and differences between expectations and reality.

Longer explanations were intentionally removed from the classification because information such as typical artifacts, value, and relationships to other phases belongs elsewhere.

The purpose of a classification is primarily to answer:

> What does this term mean?

rather than explain the complete methodology surrounding it.

---

## Reasoning Is Not an Engineering Phase

Reasoning had previously been included alongside:

Intent → Design → Implementation → Reflection

It became apparent that this was forcing a cross-cutting concept into a temporal lifecycle.

The four lifecycle phases describe **when** engineering activity occurs.

Reasoning describes **what kind of information** is being captured.

Reasoning can occur during:

- Intent
- Design
- Implementation
- Reflection

It therefore fits more naturally as an engineering information type rather than an engineering phase.

This preserves a simple lifecycle:

Intent → Design → Implementation → Reflection

while allowing Reasoning to exist independently across all phases.

---

## Classification and Organization Are Different Concerns

Although Reasoning is not an engineering phase, a project may still contain a first-class `reasoning/` directory alongside lifecycle directories.

For example:

project/
├── intent/
├── design/
├── implementation/
├── reflection/
└── reasoning/
    ├── worksheets/
    └── thought-logs/

This introduces some conceptual asymmetry, but the directory structure does not need to perfectly reproduce the underlying classifications.

Classifications answer:

> What is this information?

Project organization answers:

> Where can this information be navigated most effectively?

This suggests that project structure can be a practical projection of multiple classifications rather than a perfect representation of any single taxonomy.

A potential architectural idea emerged:

> Project structure is primarily organized by engineering lifecycle phase, with cross-cutting information given first-class locations where lifecycle classification would reduce usability.

---

## Worksheets as Independent Reasoning Artifacts

An important observation was made that worksheets and ADRs do not have a one-to-one relationship.

A worksheet may result in:

- An ADR
- Multiple ADRs
- A model
- A classification change
- Another worksheet
- No change at all

A worksheet is therefore fundamentally an investigation artifact rather than an ADR precursor.

This strengthens the case for centrally organizing project worksheets under Reasoning rather than attaching them structurally to ADRs.

A useful distinction emerged:

- **Thought Log:** What were we noticing?
- **Worksheet:** What did we deliberately investigate?
- **ADR:** What did we decide?

A worksheet that concludes that no change is necessary remains valuable engineering reasoning.

---

## Engineering Information Types Refined

The engineering information taxonomy was refined into:

- **Implementation:** Defines the concrete, implemented state of the system.
- **Models:** Defines abstract descriptions of the system used for understanding, reasoning, and generating representations.
- **Reasoning:** Captures thinking produced while exploring and understanding engineering questions, including both deliberate investigation and transient thoughts worth preserving.
- **Decisions:** Records finalized engineering choices that constrain or shape the system.
- **Representations:** Provides non-authoritative views of authoritative engineering information in forms suitable for consumption.
- **Projections:** A subtype of representation tailored to communicate selected engineering information to a particular audience or purpose.

The definitions intentionally avoid specifying where each information type is stored.

Location and authority are architectural decisions rather than part of the classification.

---

## Models Exist Independently of Diagrams

The definition of Models was deliberately broadened.

Models should not exist merely for diagramming tools.

Instead:

> Models are abstract descriptions of the system used for understanding, reasoning, and generating representations.

This preserves the previously established distinction:

Model
↓
Representation

A diagram is therefore one possible representation of a model rather than the reason the model exists.

The same model could potentially generate:

- Diagrams
- Tables
- Architecture summaries
- Other future representations

---

## Representations and Projections

Representations were explicitly classified as non-authoritative.

They provide views of authoritative engineering information rather than becoming sources of truth themselves.

Projections were then defined as a subtype of Representation.

A projection differs because it is deliberately tailored to a particular audience or purpose.

Examples could include:

- Project briefs
- Portfolio pages
- Interview artifacts
- CVs

This produces a relationship similar to:

Representation
├── General representations
└── Projection
    └── Audience/purpose-specific representation

A representation may also be incorporated into a projection.

---

## Artifact Classification Deferred

It was considered useful to eventually create a separate classification for artifact types such as:

- Thought Logs
- Worksheets
- ADRs
- README files

However, this was deliberately deferred.

Artifact classifications are expected to be more volatile than foundational classifications such as engineering phases and engineering information types.

Time is therefore better spent on higher-value foundational decisions before formalizing every artifact type.

---

## Problem Space and Solution Space

A distinction between problem-space reasoning and solution-space reasoning was explored.

Intent primarily concerns the **problem space**.

Design primarily concerns the **solution space**.

Problem-space reasoning establishes:

- The problem
- Motivation
- Audience
- Constraints
- Vision

These constrain what constitutes an acceptable solution.

Once a high-level Idea has been selected, reasoning shifts toward:

> How should this solution work?

This begins solution-space exploration.

Design then progressively constrains the possible implementation through architectural questions, models, worksheets, and ADRs.

---

## Constraints Can Affect Different Spaces

Constraints should not necessarily be classified as belonging exclusively to the problem space.

Problem-space constraints define conditions an acceptable solution must satisfy or account for.

Examples include:

- Requirements
- Preferences
- Assumptions

These behave differently:

- A **requirement** excludes unacceptable solutions.
- A **preference** makes some solutions more desirable without necessarily excluding others.
- An **assumption** defines something treated as true while reasoning.

Later architectural decisions introduce design constraints.

An accepted ADR reduces the remaining solution space by making a deliberate architectural choice that future decisions inherit.

This connects to the earlier idea that:

> ADRs reduce future design space.

---

## Idea as the Bridge Between Intent and Design

The previous uncertainty around whether `Idea` belongs at the end of Intent or beginning of Design gained a conceptual explanation.

Idea sits at the boundary between problem-space and solution-space reasoning.

Intent asks:

> What are we trying to achieve?

Idea selects:

> What high-level approach will we pursue?

Design then asks:

> How should that approach actually work?

This makes Idea a bridge:

Problem Space
↓
Intent
↓
Idea
↓
Design
↓
Solution Space

Idea fits most naturally at the end of Intent because Design implies that there is already an idea available to design.

The Idea does not need to define components, technologies, state management, failure handling, or other architectural details.

Those belong to Design.

The lifecycle is not intended to be waterfall-like; implementation discoveries may cause earlier assumptions, ideas, or designs to be revisited.

---

## Authority Worksheet Completed

With the engineering information classification established, the foundational worksheet:

> What is the authoritative source for each kind of engineering information?

became significantly easier to reason about.

Rather than deciding authority independently for every artifact, authority can now be assigned to information types.

The emerging assignment was:

- **Implementation → Repository**
- **Models → Knowledge Base**
- **Reasoning → Knowledge Base**
- **Decisions → Knowledge Base**
- **Representations → Non-authoritative**
- **Projections → Non-authoritative**

This demonstrated the value of foundational classifications: they reduce the complexity of downstream architectural decisions.

---

## Repository as Authority for Implementation

Implementation should be authoritative in the implementation repository because the repository contains the concrete artifacts defining the implemented system.

Making the knowledge base authoritative for implementation would unnecessarily duplicate implementation state and create synchronization requirements.

The repository should therefore remain the authority for concrete implementation.

---

## Knowledge Base as Authority for Models, Reasoning, and Decisions

Reasoning naturally belongs under knowledge-base authority because its purpose is to preserve the evolution of engineering understanding rather than define the implemented system.

Models and Decisions also appear best suited to knowledge-base authority.

This allows the knowledge base to preserve both current and historical engineering understanding without requiring repository documentation to explain the complete history of how the implementation reached its current state.

---

## Authority and Publication Are Separate Decisions

Representations and projections are non-authoritative by definition.

Therefore, placing a representation in the repository or knowledge base does not change the authoritative source of the underlying information.

However, this does **not** mean placement requires no thought.

Two separate questions now exist:

**Authority**

> Where is the underlying truth maintained?

**Publication**

> Where should a useful representation of that truth appear?

A README may therefore belong in a repository because that is where its audience expects to find it, while the engineering information from which it was produced remains authoritative in the knowledge base.

---

## Repository Documentation as a Derived Decision

The authority worksheet exposed a separate architectural question:

> What should repository documentation represent?

The foundational authority ADR does not need to decide:

- Which diagrams belong in repository docs.
- Which decisions should be surfaced there.
- How README files are generated.
- How knowledge-base information is published into repositories.

Those can be addressed by derived ADRs.

A possible decision dependency now looks like:

Engineering Information Classification
↓
Foundational Authority ADR
↓
Repository Documentation Responsibility ADR
↓
Representation/Publication ADRs

This allows the foundational ADR to remain narrowly concerned with authority.

---

## Overall Methodological Development

A broader pattern became increasingly clear during this period.

Foundational classification reduces the solution space of foundational ADRs.

Foundational ADRs then reduce the solution space of derived ADRs.

This creates a progression where complexity is addressed at the highest useful level rather than repeatedly reconsidered for individual artifacts.

The emerging methodology increasingly separates:

- **Classification:** What kinds of things exist?
- **Authority:** Where is truth maintained?
- **Organization:** Where can information be navigated effectively?
- **Representation:** How is authoritative information communicated?
- **Publication:** Where should those representations be made available?

These concerns are related but independently decidable.

This separation appears to make subsequent architectural decisions substantially easier because earlier foundational work constrains the available solution space.