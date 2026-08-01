# Question

What are the responsibilities of the Knowledge Base and Repository?

# Context

The problem with traditional repos is that it is currently tasked with representing the current implementation of a system and the way it got there (through adr chains, digram evolution, etc). We have introduced a knowledge base as a component that aims to synergize with a repo to show a more complete picture of how an engineer has implemented a problem.  If we separate responsibilities like so:
- Fully represent current state of system
- Show the evolution of the system

What is the best split of responsibility between the knowledge base and repo for best results?

# Solutions

## Repository-centric engineering knowledge

- This is the traditional approach, it's an option, but would mean that the knowledge base is doing nothing, not ideal
  
## Knowledge-base-centric engineering knowledge

- Now we're looking at everything inside the knowledge base, tempting, but we don't want to overload the knowledge base with responsibility, the knowledge base can contain the current state of a system but we don't necessarily want it to have to highlight the current state as well as the evolution, it may get messy

## Split responsibility between implementation and engineering understanding

- I believe this to be the most sane idea, we can take the state of the current system as a repo responsibility, as it traditionally has that responsibility anyway, and then have the knowledge base tasked with representing how a system came to be in its current state, which would be filled in as a project progresses.  Then the repo docs could easily be a selection of the current knowledge base adrs and models, though that's a concern outside the scope of this worksheet

## Duplication/ shared responsibility

- I think this has potential, but it seems like an intelligent split of responsibility would have to be made, if we just duplicate everything we're introducing drift potential between kb and repo artifacts, one place this would work well is in repo docs, as repo docs are potentially going to be the collection of current relevant knowledge base artifacts, though outside the scope of this decision

# Decision

We will split responsibility between the knowledge base and repository like so:
- The repository is responsible for the implemented state of the system.
- The knowledge base is responsible for engineering understanding and its evolution.

# Consequences

## Positive
- Repository will have less responsibility, and so will be easier to understand
- Knowledge base has responsibility, but doesn't over-reach
- Allows for richer observability of engineering reasoning in knowledge base

## Negative
- Potential drift between shared kb/ repo artifacts
- More complex to maintain
   
# Extracted questions

What relationship should exist between repository documentation and the knowledge base?