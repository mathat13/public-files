ADR-0001

Adopt a Project-Centric Knowledge Base

Problem:

How should knowledge be organized?

Decision:

Projects become the initial unit of organization.

ADR-0002

Use project.md as the Canonical Project Representation

Problem:

How should a project be represented?

Decision:

Every project contains a compressed semantic representation.

ADR-0003

Structure project.md Around the Engineering Reasoning Lifecycle

Problem:

What information should project.md contain?

Decision:

Represent Intent, Design, Implementation and Reflection.

ADR-0004

Organize Project Artifacts by Reasoning Phase

Problem:

How should project artifacts be organized?

Decision:

intent/
design/
implementation/
reflection/

instead of

adrs/
diagrams/
worksheets/

This is the one we've effectively designed today.

ADR-0005

Separate Exploration from Committed Design

Problem:

Design exploration should not be confused with architectural decisions.

Decision:

Introduce worksheets as exploratory artifacts.

ADR-0006

Capture Design Decisions as ADRs

Problem:

How should committed architectural decisions be recorded?

Decision:

Use ADRs after exploration has converged.

ADR-0007

Separate Prospective and Emergent Design Decisions

Problem:

Design decisions made before implementation differ fundamentally from those discovered during implementation.

Decision:

Maintain separate design and implementation reasoning phases.

ADR-0008

Capture Engineering Reflection Explicitly

Problem:

Implementation changes reasoning in ways that are difficult to reconstruct later.

Decision:

Record lessons and reasoning evolution after implementation.

ADR-0009

Support Progressive Knowledge Compression

Problem:

Consumers require different levels of detail.

Decision:

Every artifact should compress the meaning of lower-level artifacts while preserving intent.

This one isn't about folders.

It's about philosophy.

I actually think this becomes one of the core architectural principles.

One ADR I think you haven't noticed

This one has appeared repeatedly over the last hour.

I'd almost write:

ADR-0010

Preserve Reasoning Rather Than Documentation

Context:

Traditional documentation records what systems are.

Our objective is to preserve why systems became what they are.

Decision:

The knowledge base will prioritize artifacts that capture reasoning, trade-offs and learning over exhaustive implementation documentation.

I think that ADR is actually the philosophical heart of the project.

ADR-0011

Assign Ownership of Engineering Knowledge

Context:

The same project contains two different types of knowledge:

- implementation knowledge
- engineering reasoning

Combining them increases duplication and makes both repositories harder to navigate.

There's one thing I would write in the README before almost anything else.

Decision:

Repository documentation shall represent the system as it currently exists.

The knowledge base shall represent the evolution of reasoning that led to the current system.

Finally...

Not an ADR.

Not a vision.

Just a sentence.

This project is not intended to document software. It is intended to preserve the evolution of engineering reasoning from intent to reflection so that knowledge can be understood, communicated, and generalized over time.

Everything else we've designed—the phases, the worksheets, the ADRs, the reflections, project.md, and eventually the decisions and patterns directories—flows naturally from that statement.

When an architecture starts to exhibit that property, where individual decisions reinforce a single underlying idea instead of feeling like independent choices, it's often a sign that you've found a coherent design rather than just a collection of conventions. I think you're at that point now.