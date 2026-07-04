# Question

How should project artifacts be organized?

# Context

We have our knowledge base organized via projects, but how should our projects folder organize itself?

# Solutions

Organize artifacts by the phase of engineering reasoning they belong to:

project/
    intent/
    design/
    implementation/
    reflections/

---

Organize artifacts by artifact type:

project/
    adrs/
    diagrams/
    worksheets/
    reflections/

---

Flat:

project/
    project.md
    adr-0001.md
    adr-0002.md
    diagram-001.drawio
    worksheet-001.md

---

By concern:

project/
    architecture/
    implementation/
    communication/

---

# Reasoning

## Flat project

- Would be good for a very small project, where evolution isn't expected
- Simple to navigate with proper context
- Current project does expect to move towards automation so using flat means that automation would be using the same folder for all project artifacts, harder to reason about implementation
- Seems prone to difficulty in navigating for larger projects with many artifacts
- Also more difficult to understand what a project is composed of, or what it cares about

## By Concern

- This initially seems like a perfectly good structure, it's problem comes from the fact that it's too generalized
- Someone can look at this folder structure and work their way through navigating it, with some docs to explain it a little, but it doesn't naturally represent a project, it's just organizing by artifact but more general
- Now we're organizing by groups of artifacts, then we're organizing by artifact, which introduces unneeded complexity
- It scales well, it is ok for navigation, it would support automation fine, but it'll never be better than something that more naturally frames what a project is

## By artifact
- The same as by concern, except now we're being more honest, I guess by concern does in fact improve on this solution in a way by providing some indication to which part of a project the artifact is related to
- We'd have to decide on a structure for each sub-directory if we wanted to organize by groups
- In fact, I now rank by concern as better than simply by artifact, because you'd have to make a further decision on if we want to organize sub-directories to reflect concern when using by artifact as this would provide a easier navigation for users, but would introduce duplication of subdir subdirs if subdir layout wasn't implemented as flat
- Again, this scales well and supports automation, but is too general of a structure to beat a more natural organization

## Phase of Engineering Reasoning - Selected
- Believe to be the most natural representation of what a project is from start to finish
- It scales well, it supports automation, and it is understandable at a glance, as long as you know what each of the stages mean
- The final point meaning that it is more self-explanatory than the other solutions
- It does require a little explaining up-front, but that can be alleviated with a decent readme/ docs
- It is obviously more complex than a flat structure, but that's offset by the benefits it has over one

## Decision

We will organize projects by phase of engineering reasoning.