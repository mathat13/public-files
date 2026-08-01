- Decompose worksheets by question

- Decision chains can be visualised as graphs

- Question can appear as nodes on a navigable decision graph

- Graph removes responsibility of showing decision evolution from adr artifacts

- Graphs can act as reasoning interfact, allowing to click on questions to get adrs/ classifications/ models based on question

- Graphs naturally represent relationships between decisions

- Worksheets can end up producing different artifacts, don't know until you complete worksheet

- Worksheets can be designed to basically copy-paste to an adr

- Can formally extract questions in worksheets, allowing further separate question investigation

- Artifact responsibility adr was hiding a hidden assumption, what the responsibility was between kb and repo

- Model graph and decision graph are two types of the same thing, can cross link to eachother

- Repo docs could act as best home for model/ decision graphs, though they would be representations of kb models/ decisions

- Repo docs is currently undefined as to its complete contents, this is workable though, imagine the repo docs as existing but we don't know what it contains, we can reason over it as part of the system without defining its contents

- Pushed this idea further, if a question asks about some part of the repo docs, then define that part and leave the rest undefined, then we can answer that question without needing a full classification, very interesting

- Provisional definition of repo docs being split into implementation docs vs engineering representations

- Restricting worksheets to a single question seems to be a way of discovering a system, start with any question and extract questions that don't concern that question, keep doing this and you potentially have a full description of a system

- 