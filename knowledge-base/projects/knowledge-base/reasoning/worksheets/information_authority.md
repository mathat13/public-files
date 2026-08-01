# Question

What is the authoritative source for each kind of authoritative engineering information?

# Context

Traditional repos have acted as an authoritative source for many types of artifacts:
- Source code
- Tests
- Configuration
- README
- etc

With the introduction of the knowledge base, we have additional artifacts to consider:
- Thought Logs
- Worksheets

Also, some artifacts may be represented in both the repository and the knowledge base:
- Architecture diagrams
- ADRs

To make the question easier to answer, we have classified all artifacts to be part of certain information types, which means that for each information type, we just have to choose between the repository and the knowledge base as the authoritative source for each type.

# Authoritative Information Types

Implementation: Defines the concrete, implemented state of the system
Models: Defines abstract descriptions of the system used for understanding, reasoning, and generating representations
Reasoning: Captures thinking produced while exploring and understanding engineering questions, including both deliberate investigation and transient thoughts worth preserving
Decisions: Records finalized engineering choices that constrain or shape the system

- Implementation is repository because the repository is tasked with showing the system as it is now, implementation naturally fits into this slot

- Models and decisions are best owned by the knowledge base, this is further complimented by the repository only containing representations of the current state of the system in it's docs, offloading the burden of representing how a system got to where it is to the knowledge base, it feels like a separate adr would be pertinent for answering the question:
"What are the repo/ knowledge base tasked with representing?"

- Reasoning is best owned by the knowledge base because the knowledge base owns the prograession of how a system got to be where it is 

- Representations and projections are not authoritative in the first place, and so these can go in either the knowledge base or the repository without much thought

This would mean that we have:
Implementation -> Repository
Reasoning -> Knowledge Base
Models and decisions -> Knowledge base
with the models and decisions that represent the current state of the system being owned by the knowledge base, but being included in the repo docs

# 



