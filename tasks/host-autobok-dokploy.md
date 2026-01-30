---
state: new
created: 2026-01-30T08:20:00+00:00
priority: high
tags: [infrastructure, autobok, docker, dokploy]
---

# Host Autobok on Hetzner with Dokploy + Sablier

Deploy the autobok application on the current Hetzner machine using Dokploy for deployment management, Docker Compose for orchestration, and Sablier for dynamic preview URLs on GitHub.

## Goals

- [ ] Set up Dokploy on the Hetzner server
- [ ] Configure Docker Compose for autobok (Go backend, Next.js frontend, PostgreSQL)
- [ ] Set up Sablier for preview URL generation
- [ ] Integrate with GitHub for PR preview deployments
- [ ] Configure domains and SSL certificates
- [ ] Document deployment process

## Subtasks

- [ ] Research Dokploy installation requirements
- [ ] Install and configure Dokploy
- [ ] Create Docker Compose configuration for autobok services
- [ ] Set up PostgreSQL database container
- [ ] Configure Sablier for dynamic container management
- [ ] Set up GitHub Actions or webhook for preview deployments
- [ ] Configure domain/DNS for production and preview URLs
- [ ] Test end-to-end deployment flow
- [ ] Document the setup in knowledge base

## Technical Context

- **Server**: Hetzner (current machine)
- **Application**: autobok (Go/Fuego backend, Next.js frontend, PostgreSQL)
- **Repository**: theolundqvist/autobok
- **Preview URLs**: Should be generated per PR/commit
- **Tools**: Dokploy, Docker Compose, Sablier, GitHub webhooks

## Notes

- Sablier enables "sleeping" containers that wake on request (cost-effective)
- Dokploy provides a UI for managing deployments
- Preview URLs allow testing PRs without affecting production

## Related

- [knowledge/projects/autobok.md](/knowledge/projects/autobok.md)
- [GitHub: theolundqvist/autobok](https://github.com/theolundqvist/autobok)
