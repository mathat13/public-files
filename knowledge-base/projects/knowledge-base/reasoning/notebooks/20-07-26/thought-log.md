## 20-07-26

- Diagrams shouldn't be source of truth, instead they should be treated as generated representations of engineering knowledge

- Engineering metadata should be what diagrams are generated from. This makes the implementation language (PlantUML, Mermaid, etc.) irrelevant

- Diagrams can be split into what 'dimension' they describe, for example, diagrams representing flow (sequence, collaboration) are related in this way, and would query different parts of a flow metadata file, while diagrams of constitution (deployment, c4) would query a constitution metadata file

- Decided to implement a 'thought-log' in knowledge base, this will allow me to record understanding cheaply before it evaporates, as is very common with working with AI.  It also fills the gap between informal thinking and structured engineering reasoning

- Thought logs and worksheets serve different purposes, the latter intends to investigate a question, to record directed reasoning, to potentially evolve into an artifact; the former intends to capture any thoughts that occur during any part of the process with no expectation of conclusions

- Implementation repository contains a snapshot of the current implementation, knowledge base contains how understanding evolved, making it obvious that thought logs should be contained only within the knowledge base

- The scope of the knowledge base is larger than just projects, it naturally includes:
Personal projects
Employment
Education
Research
Open-source work
Each can act as a source of truth of engineering knowledge, allowing projection generation from each individually

- AI can act as a translator/ curator of sources of truth, it's never asked to generate knowledge, only translate existing knowledge
  
- AI's role can be split into two, firstly, it would act as a curator of knowledge, tasked with navigating the knowledge base and matching what experience matches a particualar job advertisement.  The translator would take this curated input and produce an end-user optimized view of that information, neither role is tasked with generating new information