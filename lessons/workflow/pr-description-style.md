---
keywords: [pr, pull request, description, gh pr create]
---

# PR Description Style

## Rule
Write PR descriptions in a conversational, honest style that explains the "why" clearly and admits limitations.

## Context
When creating pull requests in FDM repos or any professional codebase.

## Detection
Signs your PR description needs improvement:
- Sounds like corporate boilerplate
- Doesn't explain *why* you made the change
- Overly verbose benefits lists
- Hides limitations or uncertainties
- Third person when first person is clearer

## Pattern

**Title format**: `Type (scope): Description`
- Types: Fix, Feat, Chore, Refactor, Tests, Modelling
- Scope: (frontend), (backend), (dbt), (ci), etc.
- Examples:
  - `Fix (frontend): Clamp event starts to the beginning of the video`
  - `Feat (backend): Tenant groups + filter to user tenants`
  - `Chore (backend): Handle drops across unphysical scale weight changes`

**Motivation**: Conversational, explains the real "why"
```markdown
## Motivation for changes

It is kind of slow.
```

```markdown
## Motivation for changes

The manual review page was feeling very sluggish/jumpy for me; part of that
is a *lot* of unnecessary re-rendering.
```

```markdown
## Motivation for changes

I wanted to use my local tables when testing the pipeline locally (since
they haven't been materialised in staging or prod).
```

**Description**: Concise, bullet points for multiple items
```markdown
## Description of changes

- Split the video control context into an actions part and a state part.
- Throttled the computation of the railcar movements.
- Did a bunch of memoisation/prevented values from changing each render.
```

**Tests**: Honest about coverage and limitations
```markdown
## Tests of changes

This does not actually speed it up by much. Nice to have the tqdm though.
```

```markdown
## Tests of changes

Seems a lot smoother to me locally now (could also be due to lower memory
usage since I restarted my browser, who knows?).
```

```markdown
## Tests of changes

Added some unit tests. Looks like this:
[screenshot]
```

**Notes** (optional): Caveats, next steps, callouts
```markdown
## Notes

We'll need to tell the labellers this isn't 100% trustworthy
```

```markdown
## Notes

@theolundqvist, I still haven't done the thing of changing how the model
features are specified, as we discussed yesterday. Going to work on that next.
```

**Related PRs** (when applicable):
```markdown
## Related PRs

- Infrastructure: #23577
- TownSquare: #9892
```

## Anti-Pattern

❌ **Verbose corporate style**:
```markdown
## Motivation

This PR implements significant improvements to the system architecture
enabling better scalability and maintainability going forward.

## Benefits

- Improved performance
- Better maintainability
- Enhanced scalability
- Reduced complexity

## Documentation Links
- [Link 1]
- [Link 2]
```

✅ **Conversational honest style**:
```markdown
## Motivation for changes

The current approach is kind of cursed and hard to maintain. This simplifies
it by using ApplicationSet instead of a jsonnet loop.

## Description of changes

Replaced the tenant loop with ApplicationSet. Kept tenants.yaml for the
generator script.

## Tests of changes

Verified the generated manifests look correct. Haven't tested on real cluster yet.

## Notes

Might need to delete old Applications before deploying - not sure if ArgoCD
handles the transition automatically.
```

## Outcome
Following this pattern results in:
- PRs that are quick to review (clear motivation)
- Honest communication (limitations stated upfront)
- Better collaboration (conversational tone invites feedback)
- Readable history (PRs explain *why*, not just *what*)

## Related
- [Git Workflow](../../gptme-contrib/lessons/workflow/git-workflow.md) - Commit practices
