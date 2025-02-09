# Konfig

> Note: Sync from the [modules](https://github.com/kcl-lang/modules/tree/main/konfig) code repo.

[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fkcl-lang%2Fkonfig.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2Fkcl-lang%2Fkonfig?ref=badge_shield)

[English](README.md) | [Chinese](README-zh.md)

Konfig is the repository of the infra configuration in KCL.

Konfig provides users with an out-of-the-box, highly abstract configuration interface. The original starting point of the model library is to improve the efficiency and experience of YAML users. We hope to simplify the writing of user-side configuration code by abstracting and encapsulating the model with more complex code into a unified model.

For more details, please refer to: [Model Overview](https://kcl-lang.io/docs/user_docs/guides/working-with-konfig/overview)

## Directory Structure

The overall structure of the configuration library is as follows:

```bash
.
├── LICENSE
├── Makefile
├── README-zh.md
├── README.md
├── examples            # konfig examples
├── kcl.mod             # konfig package metadata file
├── kcl.mod.lock        # konfig package metadata lock file
└── models
    ├── commons         # Common models
    ├── kube            # Cloud-native resource core models
    │   ├── backend         # Back-end models
    │   ├── frontend        # Front-end models
    │   │   ├── common          # Common front-end models
    │   │   ├── configmap       # ConfigMap
    │   │   ├── container       # Container
    │   │   ├── ingress         # Ingress
    │   │   ├── resource        # Resource
    │   │   ├── secret          # Secret
    │   │   ├── service         # Service
    │   │   ├── sidecar         # Sidecar
    │   │   ├── strategy        # strategy
    │   │   ├── volume          # Volume
    │   │   └── server.k        # The `Server` model
    │   ├── metadata        # Kubernetes metadata
    │   ├── mixins          # Mixin
    │   ├── render          # Front-to-back-end renderers.
    │   ├── templates       # Data template
    │   └── utils
    └── metadata           # Common metadata
```

## Prerequisites

Install [KCL](https://kcl-lang.io/docs/user_docs/getting-started/install)

## Quick Start

See [here](https://kcl-lang.io/docs/user_docs/guides/working-with-konfig/guide)

## Resources

- More examples can be found [here](https://github.com/kcl-lang/konfig/blob/main/examples/README.md)
- Konfig schema reference document can be found [here](https://github.com/kcl-lang/konfig/blob/main/docs/konfig.md)

## License

Apache License Version 2.0

[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fkcl-lang%2Fkonfig.svg?type=large)](https://app.fossa.com/projects/git%2Bgithub.com%2Fkcl-lang%2Fkonfig?ref=badge_large)
