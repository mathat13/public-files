Summary (27/07/26 → 28/07/26)

Today's work represented another significant evolution of the methodology. Whereas the previous sessions established the worksheet as the primary tool for local reasoning, this session established the reasoning graph as the complementary tool for global reasoning. By the end of the session, the graph had evolved from a simple visualisation idea into an active component of the engineering process itself.

Local Reasoning vs Global Reasoning

A clear separation of concerns emerged between worksheets and the graph.

The worksheet remains responsible for reasoning about a single engineering question.

The graph is responsible for reasoning about the relationships between those questions.

Question

↓

Worksheet (local reasoning)

↓

Graph (global reasoning)

This distinction explained why both artifacts are valuable despite containing overlapping information.

The worksheet captures the detailed thought process surrounding an individual question.

The graph captures how all questions relate to one another across the architecture.

Together they reduce cognitive load by separating detailed reasoning from overall architectural structure.

The Graph as a Development Tool

An important distinction emerged between the graph used during engineering and any graph eventually published as repository documentation.

The development graph should be:

easily editable
tolerant of incomplete understanding
capable of changing frequently
focused on supporting reasoning rather than presentation

A published graph, by contrast, would likely be generated from more authoritative information once the design stabilises.

This reinforced the broader principle that development artifacts and published representations serve different purposes.

AI Collaboration as a Design Requirement

A significant design constraint emerged during discussion.

The graph should not merely be human-readable.

It should also be easily understandable by an AI assistant.

This introduced two important requirements:

textual representation
visual representation

The textual representation enables collaboration with AI.

The visual representation enables rapid human reasoning.

Rather than choosing between them, the methodology seeks a representation that naturally supports both.

Evaluation of Graph Representation Languages

Several candidate technologies were explored.

These included:

PlantUML
Mermaid
Graphviz

The discussion shifted away from evaluating them as diagramming tools and towards evaluating them as representations of engineering reasoning.

Graphviz emerged as the strongest candidate because it offers:

textual representation
straightforward AI parsing
version control friendliness
flexible graph layout
sufficient control over visual structure
relatively simple syntax for the intended use case

The ability to influence graph layout was considered particularly important because the graph is intended to communicate architectural reasoning rather than merely display connections.

Stable Node Identity

One particularly important discovery concerned node identifiers.

Graphviz allows each node to have:

a stable identifier
an independent display label

For example:

Identifier

↓

kb_repo_responsibility

↓

Label

↓

What are the responsibilities of the
Knowledge Base and Repository?

This naturally aligned with other project artifacts.

For a single engineering question:

Identifier

↓

kb_repo_responsibility

becomes the common identity for:

worksheet filename
ADR filename
graph node
future references

while the displayed question remains free to evolve independently.

This establishes a stable identity across multiple representations of the same engineering concept.

Separation of Identity and Presentation

The use of Graphviz labels introduced another useful distinction.

The identifier represents engineering identity.

The label represents presentation.

Visual improvements such as line breaks therefore become presentation concerns rather than semantic changes.

For example:

What are the responsibilities of
the Knowledge Base and Repository?

is simply an improved rendering of the same question.

Metadata as an Evolution Path

Graphviz's support for arbitrary node attributes suggested a natural evolution path.

Although only labels are currently required, additional metadata could later be introduced without affecting visualisation.

Potential future metadata includes:

produced artifact
worksheet reference
status
ownership
identifiers
relationships

This suggests Graphviz can evolve alongside the methodology rather than immediately requiring a bespoke source-of-truth format.

The Graph Reveals Missing Questions

Building the graph immediately exposed new architectural insights.

Most notably:

the existing classifications themselves require worksheets.

For example:

What types of engineering information exist?

↓

Worksheet

↓

Engineering Information Types Classification

Previously the classifications had been treated primarily as outcomes.

The graph demonstrated that they themselves arise from answering explicit engineering questions.

Improved Dependency Reasoning

The graph also helped clarify dependencies between questions.

A useful example concerned repository documentation.

Originally it appeared that:

Repository Documentation Relationship

↓

Documentation Responsibilities

might be related.

Visualising the graph made it clear that the prerequisite is actually:

Repository Documentation Definition

↓

Repository Documentation Relationship

The relationship question requires understanding what repository documentation is, but not yet what responsibilities it should ultimately have.

This represented a refinement of the architectural reasoning that emerged directly from visualising dependencies.

The Graph as a Reasoning Instrument

An important conceptual shift occurred.

Initially the graph was viewed as a visual representation of architecture.

By the end of the session it had become clear that the graph actively assists engineering reasoning.

Specifically it helps:

identify missing questions
reveal prerequisite relationships
expose architectural structure
identify converging reasoning
reduce working memory requirements
support collaboration with AI

Rather than documenting completed reasoning, the graph now participates in producing that reasoning.

Artifact-Type Visualisation

A simple visual language began to emerge.

Initially all questions are represented as ovals.

Only once a worksheet has produced a durable artifact does the node change shape.

Current mapping:

Oval

↓

Artifact undetermined
Rectangle

↓

ADR produced
Diamond

↓

Classification produced

This deliberately avoids assuming the eventual artifact before the worksheet has completed.

Separating Artifact Type from Lifecycle

Another useful distinction emerged.

Node shape represents:

What artifact exists?

Node style represents:

What stage is the reasoning process in?

A possible lifecycle was proposed:

Dashed Oval

↓

Question identified

↓

Solid Oval

↓

Worksheet in progress

↓

Double Oval

↓

Worksheet complete

↓

Rectangle / Diamond

↓

Artifact produced

Although not yet implemented, this provides room for representing engineering progress independently of artifact type.

The Graph as an Engineering Notebook

An important philosophical observation emerged.

The graph is not intended to be immediately correct.

Instead it represents current understanding.

Relationships are expected to change as reasoning progresses.

This removes pressure to achieve correctness early and instead encourages iterative refinement.

The graph therefore behaves much like the worksheets themselves:

an active engineering notebook rather than final documentation.

Emergence over Design

One of the strongest recurring themes of the session was resisting premature abstraction.

Rather than designing:

node taxonomies
edge taxonomies
metadata schemas
graph languages

up front,

only the minimum necessary concepts were introduced:

questions
relationships
stable identifiers
artifact shape
lifecycle style

Additional concepts will only be introduced once repeated use demonstrates a genuine need.

Current Emerging Methodology

By the end of the session the overall engineering process can now be viewed as:

Engineering Question

↓

Worksheet

↓

Reasoning Graph

↓

Engineering Understanding

↓

Durable Artifact

where:

the worksheet supports local reasoning,
the graph supports global reasoning,
durable artifacts record stable engineering knowledge.