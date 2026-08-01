# Question

Which engineering information types are authoritative?

# Context

We've defined the information types in information_authority, pasted here for convenience:

---

Implementation: Defines the concrete, implemented state of the system

Reasoning: Captures thinking produced while exploring and understanding engineering questions, including both deliberate investigation and transient thoughts worth preserving

Knowledge: Records finalized engineering choices that constrain or shape the system

Representations: Provides views of engineering information in forms suitable for consumption

Projections: A subtype of representation tailored to communicate selected engineering information to a particular audience or purpose

---

We want to decide which of these information types can be considered as a source of truth (authoritative), and which ones are not.

# Exploration

- We'll start with implementation, from the definition, it seems that we're talking about a source of truth, this information type defines the implementation of the system, so to me, that means that we can look at this as an authoritative source of the implementation of the system

- Next we have reasoning, these types are going to record how we actually reacked a knowledge artifact, they're written with no other artifact in mind, just reasoning, I think this is a valuable indicator in general, and points to reasoning being autoritative

- Knowledge is deistilled from reasoning, so it is a representation of reasoning in this way, I believe that what a knowledge type isn't necessarily optimizing it's structure for a particular audience, and so it isn't a projection, this is interesting, but I think looking at it from the perspective of consumers of the knowledge base, knowledge is a source of truth, and so we'll go for knowledge being authoritative

- Next is representations, but we'll postpone that, projections seems easier, projections are intended to communicate something to a particular audience, I think something that is true of all representations is that they require another type to represent, but this doesn't necessarily mean that they're a source of truth or not, I think what matters is if they're optimizing for a particular audience or a general audience, projections optimize another type for a particular audience, so they're not authoritative, the artifact behind them is, while representations that are not projections are authoritative, and the type behind them is authoritative (reasoning)

- So with that, we've got the following relationships:

Information Type    Authorititiveness
Implementation      Authoritative
Reasoning           Authoritative
Knowledge           Authoritative
Representations     Authoritative/ Non-Authoritative
Projections         Non-Authoritative

- Ok, so I've realized taht we've got a muddy definition of authority, I've written another worksheet to answer just that question, and I've got the following:

---
# Question

Which engineering information types are authoritative?

# Answer

Engineering information is authoritative when it is responsible for defining a particular aspect of engineering reality. When uncertainty or disagreement arises about that aspect, the authoritative information is the source that resolves it.

---

- So now we look over our information types and decide again:

- Implementation, what is implementation authoritative for?  Well we trust implementation to show us the implemented system, and if there was any confusion about how a design is implemented, we'd look towards implementation first, so implementation is authoritative over teh the implemented system

- Reasoning, reasoning is authoritative for the reasoning process, if we want to check how a knowledge artifact was produced, we'd check the reasoning artifacts associated with that knowledge artifact, reasoning is authoritative

- Knowledge, well knowledge is authoritative over the decisions that have been made, people can look at knowledge artifacts and know completely what decision has been made, so knowledge artifacts are authoritative

- Projections can't really be considered authoritative over something because it's always going to just re-organize other artifact, therefore it doesn't have anything authoritative over, and so a projection is non-authoritative

- Finally we have representations, these are a broader category that I first realized, is knowledge a representation of the reasoning process, I guess, but does that make it authoritative?  Not really, I think this category is hiding sub-categories that would actually be considered authoritative or non-authoritative, but I feel no pressure currently to extract further sub-types from representations, therefore I'm not actually going to define representations authority until further sub-types are extracted, leaving us with the following:

---

Information Type    Defines
Implementation      The implemented system
Reasoning           The reasoning process
Knowledge           Engineering decisions and understanding
Projection          No aspect of engineering reality

and as such, we have:

Information Type    Authoritative
Implementation      Yes
Reasoning           Yes
Knowledge           Yes
Projection          No
Representation      Deferred

---

- I think the final artifact answers two questions:
"Which engineering information types are authoritative?"
"What is each authoritative information type authoritative over?"
I could split into two, but I think these two artifacts need eachother to make sense, will finalize for now
