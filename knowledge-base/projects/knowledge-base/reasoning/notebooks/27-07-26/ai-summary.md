# AI Summary — 24/07/26 to 27/07/26

## Decision Decomposition Through Modular Worksheets

A potential methodology emerged from observing how architectural worksheets naturally become easier to reason about when restricted to answering a single question.

The process begins with a question and attempts to answer only that question.

When reasoning exposes another independent question, rather than expanding the current worksheet to answer it, the new question can be extracted into its own worksheet.

This produces a recursive process:

1. Define a question.
2. Reason about that question.
3. Identify assumptions or subordinate questions.
4. Extract independent questions rather than resolving them inside the current worksheet.
5. Complete the current decision.
6. Investigate extracted questions separately where worthwhile.

This appears capable of organically decomposing a complex architectural problem without requiring the complete decision structure to be designed beforehand.

---

## Decision Chains Are Better Understood as Decision Graphs

Initially, extracted decisions appeared to form chains:

Foundational Decision
→ Derived Decision
→ Derived Decision

However, a graph is a better abstraction.

A single decision may expose multiple derived questions, while a derived question may depend on multiple earlier decisions.

For example:

Decision A ──┐
             ├──→ Decision C
Decision B ──┘

This allows the relationships between decisions to emerge organically rather than requiring a predefined hierarchy.

---

## Questions as First-Class Nodes

Questions appear to be better graph nodes than ADRs themselves.

A question exists independently of the artifacts used to investigate or answer it.

For example:

Question
├── explored by → Worksheet
└── answered by → ADR

Some questions may never require an ADR.

This allows the reasoning structure to survive regardless of the eventual artifact produced.

The question also acts as a natural conceptual link between a worksheet and its resulting ADR.

---

## External Decision Graph

Maintaining parent and child relationships inside individual ADRs was considered, but this introduces synchronization problems.

In particular, an existing ADR cannot know which future decisions will eventually derive from it.

An external decision graph therefore appears preferable.

The graph can become authoritative for relationships between questions while individual ADRs remain focused on recording decisions.

This avoids modifying historical ADRs whenever new derived decisions are discovered.

---

## Decision Graph as a Reasoning Interface

The graph may provide substantially more value than simple navigation.

At a high level, someone could inspect the graph to understand:

- Which decisions depend on which others.
- Where unresolved questions remain.
- Where reasoning may contain gaps.
- Where decisions potentially overlap.
- Where circular reasoning may exist.
- Where separate branches potentially contradict each other.
- Which decisions appear unsupported by foundational reasoning.

This enables progressively deeper inspection:

Decision/Reasoning Graph
→ ADR
→ Worksheet
→ Thought Log

Someone could reason over the project's decision structure at a high level and only descend into detailed artifacts where necessary.

---

## Decision Model and Generated Decision Graph

The relationships between decisions may eventually constitute a model in their own right.

For example, a decision model could record:

- Question identifier.
- Parent/prerequisite questions.
- Worksheet exploring the question.
- ADR answering the question.
- Questions derived from the decision.
- Current resolution status.

The interactive decision graph could then become a generated representation of this authoritative model rather than a manually maintained source of truth.

This follows the existing principle:

Authoritative Model
→ Generated Representation

The same decision model could potentially generate:

- Interactive decision graph.
- ADR index.
- Question index.
- Unanswered-question report.
- Navigation structures.

This remains a potential future direction rather than something requiring immediate implementation.

---

## Foundational and Derived ADRs

A useful distinction emerged between foundational and derived ADRs.

A foundational ADR derives primarily from:

- Real-world/project context.
- Requirements.
- Classifications.
- Other non-decision premises.

A derived ADR has its solution space materially constrained by one or more earlier architectural decisions.

This distinction does not need to be strictly binary, because decisions can depend on multiple decisions and simultaneously become foundational to many downstream decisions.

The graph naturally represents these relationships.

---

## Progressive Constraint

A broader pattern emerged between the knowledge-base folder architecture and the ADR system.

High-level decisions should establish useful constraints without unnecessarily specifying lower-level choices.

For example:

Knowledge Base
→ organized by projects

Project
→ organized according to major project structure

But organization below that level can remain flexible until additional constraints become valuable.

The same behaviour appears in ADR reasoning:

Foundational ADR
→ constrains derived ADR
→ constrains more local ADR
→ eventually leaves mundane/reversible implementation choices

As decisions descend through the graph, the parent decisions reduce the available solution space.

This explains why derived decisions may become progressively easier to reason about.

Eventually the remaining choice may be too insignificant, reversible, or constrained to justify an ADR.

A potential emerging principle is:

> Decisions should constrain downstream solution spaces without unnecessarily determining them.

This should remain an observation until it is supported across more concrete decisions.

---

## Knowledge Base and Repository Responsibility ADR

A foundational worksheet was completed asking:

> What are the responsibilities of the Knowledge Base and Repository?

Several alternatives were considered:

- Repository-centric engineering knowledge.
- Knowledge-base-centric engineering knowledge.
- Split responsibility.
- Duplication/shared responsibility.

The selected direction was a split of responsibilities:

- Repository → implemented system.
- Knowledge Base → engineering understanding and its evolution.

This formulation was preferred over defining responsibility in terms of physical artifact placement.

The distinction establishes conceptual responsibility while allowing later ADRs to determine authority, representation, publication, and synchronization.

---

## Worksheets Can Be Designed to Distill Naturally Into ADRs

The completed responsibility worksheet used approximately:

Question
Context
Solutions
Decision
Consequences
Extracted Questions

This maps naturally into an ADR:

Question
Context
Decision
Consequences
Alternatives Considered

This means the ADR does not need to be authored independently.

Instead, it can act as a durable distillation of completed worksheet reasoning.

The full reasoning remains available in the worksheet for readers requiring greater depth.

---

## Extracted Questions Should Remain Visible

Modularity does not require pretending that related concerns do not exist.

A worksheet can encounter a related concern, consider its implications for the current question, explicitly mark it as outside scope, and extract it.

For example:

> Repository documentation could contain current representations of knowledge-base models and decisions, though the exact relationship is outside the scope of this decision.

The extracted question then becomes:

> What relationship should exist between repository documentation and the knowledge base?

This preserves relevant reasoning without allowing the current worksheet to expand into multiple decisions.

---

## Parent Questions and Child Questions

A useful diagnostic emerged for modular worksheet reasoning.

When another question appears:

### Parent/prerequisite question

Ask:

> Am I implicitly assuming the answer to another unresolved question?

If yes, that question may be a prerequisite/parent.

### Child/derived question

Ask:

> Has answering this question exposed another independently answerable question?

If yes, that question may be derived from the current decision.

This means a worksheet can discover the decision graph both upward and downward.

The engineer does not need to begin at the root of the graph.

---

## Engineering Information Authority Classification

The engineering information types were reconsidered in terms of authority.

Rather than calling information types themselves "sources of truth", a more precise distinction emerged:

### Authoritative Information Types

- Implementation
- Models
- Reasoning
- Decisions

### Non-Authoritative Information Types

- Representations
- Projections

A particular artifact/location can then be the authoritative source for an authoritative information type.

This prevents conflating:

> What kind of information is this?

with:

> Where is the authoritative source for this information?

The authority ADR therefore only needs to consider authoritative information types.

---

## Responsibility ADR Constrains the Authority ADR

The earlier authority question:

> What is the authoritative source for each kind of engineering information?

was found to contain an implicit assumption about the responsibilities of the repository and knowledge base.

The newly established responsibility ADR provides that missing parent constraint:

Repository → implemented system
Knowledge Base → engineering understanding

This makes the likely authority assignment significantly easier to reason about:

Implementation → Repository
Models → Knowledge Base
Reasoning → Knowledge Base
Decisions → Knowledge Base

The ease of reaching these conclusions is evidence that foundational decisions successfully reduce downstream solution spaces.

---

## Model Graph and Decision Graph Symmetry

A strong conceptual symmetry emerged between Models and Decisions.

Models primarily answer questions such as:

- What exists?
- How is it structured?
- How does it behave?

Decisions primarily answer:

- Why is it this way?

Both could therefore have graph-based navigation.

The model graph navigates engineering models.

The decision graph navigates engineering decisions and their reasoning dependencies.

This creates two complementary views of a system:

Models → What / How
Decisions → Why

---

## Questions as an Interface to Models

The question-based navigation technique used by the decision graph may also be valuable for model graphs.

For example:

> How is the system deployed?

could expose the deployment portion of a model.

> What does the DDNS service depend on?

could expose relevant dependencies.

> How does synchronization occur?

could expose behavioural model information.

Unlike the decision graph, the questions would not necessarily be the underlying model entities.

Instead, they could act as queries or navigation interfaces over authoritative model entities and relationships.

---

## Cross-Linking Model and Decision Graphs

The model graph and decision graph could potentially cross-link.

For example:

Model Graph:

> How is the service deployed?

→ Container on Host Server

Then:

> Why is it containerized?

could navigate into the Decision Graph.

Likewise, a decision explaining why containerization was selected could provide:

> Show resulting architecture

which navigates back into the relevant Model Graph.

This creates a powerful navigation relationship:

Model → What/How
Decision → Why

Users could move between the resulting architecture and the reasoning responsible for producing it.

---

## Graphs as Repository Documentation

The model and decision graphs appear potentially valuable as repository documentation.

The repository is responsible for the current implementation, so repository documentation could provide a current-state projection containing:

- Current model graph.
- Current decision graph.
- Cross-links between them.

This could allow someone entering a repository to begin with two high-level questions:

> Show me the system.

and:

> Explain why the system is this way.

The knowledge base could retain the complete historical/evolutionary graph, while the repository presents only information relevant to the current implementation.

---

## Repository Documentation as a Projection

An important possibility emerged:

> Repository documentation may itself be a projection.

The knowledge base remains authoritative for engineering understanding.

Repository documentation could project the subset of that engineering understanding relevant to the current implementation.

For example:

Knowledge Base
├── Models
├── Decisions
├── Reasoning
└── Historical information
        ↓
Current-state projection
        ↓
Repository Documentation
├── Model Graph
├── Decision Graph
└── Supporting representations

This would allow repository documentation to contain useful architectural reasoning without becoming authoritative for that reasoning.

This remains a candidate solution for the extracted repository-documentation relationship question rather than a finalized decision.

---

## Repository Documentation Is Currently an Undefined Concept

Attempting to answer:

> What relationship should exist between repository documentation and the knowledge base?

revealed another prerequisite:

> What is repository documentation?

"Repository documentation" currently acts as an undefined blob containing potentially very different kinds of information.

Examples include:

- Setup instructions.
- API documentation.
- Configuration reference.
- Architecture diagrams.
- Decision summaries.
- Model graph.
- Decision graph.

Treating all of these identically could make downstream reasoning unclear.

---

## Implementation Documentation vs Engineering Representations

A provisional distinction was explored.

### Implementation Documentation

Documentation concerned with using, operating, developing, deploying, configuring, or interfacing with the implementation.

Potential examples:

- Setup instructions.
- Configuration reference.
- API documentation.
- CLI usage.
- Development setup.
- Deployment instructions.
- Operational information.

### Engineering Representations

Documentation that communicates engineering understanding surrounding the implementation.

Potential examples:

- Architecture diagrams.
- Model representations.
- Decision summaries.
- Model graph.
- Decision graph.

However, this classification should not yet be promoted into a permanent taxonomy until its usefulness is validated through further reasoning.

---

## Documentation Is Not Necessarily an Information Type

An important distinction emerged:

> Documentation may be a medium/container rather than an engineering information type.

For example, generated API documentation may be a representation of implementation:

Source Code
→ Generated API Documentation

Meanwhile, some specifications could potentially be authoritative depending on the engineering process.

Therefore, something should not be classified as authoritative or non-authoritative merely because it is "documentation".

A more useful question is:

> Does this artifact define authoritative information, or describe information defined elsewhere?

---

## Undefined Blobs and Lazy Decomposition

A useful reasoning technique emerged from the repository-documentation problem.

An abstraction does not need to be completely understood before it can participate in other decisions.

For example:

Repository
└── Documentation [undefined]

If another decision only requires the fact that repository documentation exists, this is sufficient.

Only when reasoning requires greater resolution do we ask:

> What is repository documentation?

and decompose the abstraction further.

This can be understood as **lazy decomposition of engineering knowledge**.

The cost of defining something in greater detail is paid only when another question requires that detail.

---

## Minimum Sufficient Classification

The repository-documentation relationship question does not require a complete classification of every possible kind of repository documentation.

It is currently primarily concerned with documentation derived from knowledge-base Models and Decisions.

Therefore, the worksheet could establish a local working classification:

Repository Documentation [partial]
├── Current Model Representations
├── Current Decision Representations
└── Other documentation [undefined]

This provides enough footing to answer the current question without prematurely deciding:

- Whether API documentation is authoritative.
- How implementation-derived documentation works.
- How repository docs are structured.
- How documentation is generated.
- What every possible documentation category is.

The decision can therefore establish:

> Repository documentation contains at least representations of the current Models and Decisions relevant to the implementation.

without asserting:

> Repository documentation consists exclusively of Models and Decisions.

---

## Incremental Classification

Classifications may not always need to be completely designed upfront.

Instead, they could emerge incrementally from concrete reasoning:

Worksheet A
→ requires understanding X
→ classify X

Worksheet B
→ requires understanding Y
→ extend classification

Worksheet C
→ does not require understanding Z
→ leave Z undefined

Once enough stable working classifications accumulate, they could be consolidated into a durable classification artifact.

This mirrors the earlier treatment of Principles: avoid prematurely formalizing concepts that are still emerging from concrete engineering reasoning.

---

## Worksheets Can Produce Different Artifact Types

The repository-documentation question exposed a broader development in the worksheet concept.

A worksheet does not necessarily exist to produce an ADR.

Instead:

Question
→ Worksheet
→ Appropriate durable artifact

Depending on the nature of the question, the result might be:

- ADR.
- Classification.
- Model.
- Another artifact.
- No durable artifact.

For example:

> What are the responsibilities of the KB and repository?

→ Worksheet
→ ADR

while:

> What is repository documentation?

→ Worksheet
→ Classification

This makes worksheets general-purpose structured reasoning artifacts rather than ADR-specific precursors.

---

## Potential Reasoning Graph

Because questions can now lead to artifacts other than ADRs, the emerging graph may ultimately be broader than a Decision Graph.

Potentially:

Question
├── explored by → Worksheet
└── resolved by:
    ├── ADR
    ├── Classification
    ├── Model
    └── Nothing

The Decision Graph could then be a projection of a broader **Reasoning Graph**, containing the subset concerned specifically with architectural decisions.

This is currently speculative and should not yet replace the Decision Graph concept, but it is worth observing as more worksheets are created.

---

## Emerging Modular Worksheet Method

The strongest recurring pattern during this period is that restricting worksheets to a single question appears to organically reveal the structure of engineering reasoning.

A provisional process is:

1. Start with any engineering question.
2. Create a worksheet concerned only with that question.
3. Reason until something prevents the question from being answered cleanly.
4. If terminology is unclear, perform classification.
5. If an unresolved assumption is discovered, extract a prerequisite/parent question.
6. If the answer exposes a new independent concern, extract a derived/child question.
7. Keep related concerns visible where they affect the current reasoning, but do not resolve them unnecessarily.
8. Define concepts only to the resolution necessary for the current question.
9. Produce the durable artifact appropriate to the question.
10. Repeat only where further reasoning provides value.

The resulting graph does not need to be designed beforehand.

Instead, it emerges from attempts to keep individual reasoning artifacts modular.

This appears to transform a large, difficult architectural problem into a navigable collection of independently answerable questions while preserving the relationships between them.