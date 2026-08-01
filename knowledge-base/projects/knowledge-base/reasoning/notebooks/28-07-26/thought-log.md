- Implemented a lightweight graph in graphviz to represent relationships between decisions

- This allows us to look at worksheets as a way to reason about local decisions, and the decision graph as a way to reason about global decisions, potentially synergizing massively

- Chose graphviz because it has the best balance of visualization and ai reasoning ability, plantuml and mermaid decide structure for you

- Introduced shape type in graph as a way of representing the type of artifact produced

- Thought about shape border as a way of representing artifact production status

- The graph is intentionally lightweight to make it easily editable, this should fit well with the volatility of the reasoning process

- Matched graph node identifiers to worksheet/ artifact filenames and labels to questions in those artifacts

- Seems like graphviz can fully support the movement towards a source of truth language like yaml or markdown, while staying lightweight for now

- Graph has already revealed missing artifacts, and allowed reasoning over the relationship between questions, something that would have to have been done in my head beforehand

- 