# Question

What relationship should exist between repository documentation and the knowledge base?

# Context

We have asserted that the knowledge base shall be responsible for engineering understanding and our repository as responsible for the implemented state of the system, but our repository docs can contain multiple different types of artifacts, how should we view the relationship between each of these types of information and the knowledge base?

# Reasoning

- Well there's a hidden problem here, we're trying to draw relationships between the different types of information in documentation and the knowledge base without classifying that information

- If we think about it, repository documentation can be representative of multiple things, so we should start by trying to classify this information:

- Implementation documentation: Can be fully generated from the implementation alone
- Engineering representation: Can be fully generated from the knowledge base alone

- Sometimes the repo docs are authoritative though, as in the case of 