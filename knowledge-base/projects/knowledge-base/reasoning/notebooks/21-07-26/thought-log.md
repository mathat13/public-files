- Repository should be considered holistically, including:
Source code
Tests
Configuration
Build scripts
Documentation
instead of just docs.

- Led to question of what is authoritative (repo or knowledge base) for each type of engineering information

- Currently leaning towards knowledge base owning engineering understanding, repo authoritative for executable implementation

- Made distinction between foundational and derived adrs, foundational adrs establish architectural principles that constrain derived adrs.

- Classified types of engineering information and introduced a classification top-level project folder to contain them

- Classification folder should help to centralize classifications of types that is currently spread among other types of information (adrs, worksheets, diagrams, etc)

- Information types describe conceptual categories, artifact types describe concrete engineering artifacts

- ADRs can reference classification to offload the responsibility of defining concepts within adrs

- Principles discussed as a potential artifact derived from groups of adrs, intended as a centralization of the effect of adrs on the solution space

- Principles can contain links to supporting adrs to allow traceability

- Current methodology for creating a project is slowly stabilising:
Classification
↓
Worksheets
↓
Foundational ADRs
↓
Derived ADRs
↓
Principles

Each artifact has a distinct responsibility:

- Classification defines vocabulary
- Thought Logs capture ideas
- Worksheets explore questions
- ADRs record decisions
- Principles summarise recurring architectural truths