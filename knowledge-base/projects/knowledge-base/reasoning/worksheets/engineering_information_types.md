# Question

What types of engineering information exist?

# Context

We have created the classification artifact before the worksheet so we'll paste the current classification here: 

---

# Authoritative

Implementation: Defines the concrete, implemented state of the system
Models: Defines abstract descriptions of the system used for understanding, reasoning, and generating representations
Reasoning: Captures thinking produced while exploring and understanding engineering questions, including both deliberate investigation and transient thoughts worth preserving
Knowledge: Records finalized engineering choices that constrain or shape the system

# Non-Authoritative

Representations: Provides non-authoritative views of authoritative engineering information in forms suitable for consumption
Projections: A subtype of representation tailored to communicate selected engineering information to a particular audience or purpose

---

- We've noticed that we've embedded the notion of whether an information type is authoritative or not into the classification, this is a separate question "Which engineering information types are authoritative?", and so we'll extract that to another worksheet

- Secondly, we've developed a new category for information types, knowledge or reasoning artifacts, reasoning artifacts already exist in this classification, so that's fine, but knowledge artifacts are what we imagine are the final results of the reasoning process, so adrs, classifications, etc

- So with that, the new information types will look like this:

---

Implementation: Defines the concrete, implemented state of the system

Reasoning: Captures thinking produced while exploring and understanding engineering questions, including both deliberate investigation and transient thoughts worth preserving

Knowledge: Records finalized engineering choices that constrain or shape the system

Representations: Provides views of engineering information in forms suitable for consumption

Projections: A subtype of representation tailored to communicate selected engineering information to a particular audience or purpose

---

- This is a completely general view of engineering information, with no mention of authoritativity, and also with knowledge artifacts combined into their broad category, I'll leave the definition of individual artifact types for another worksheet, they'll be quite volatile potentially and won't necessarily add value to this artifact

# Extracted Questions

- Which engineering information types are authoritative?