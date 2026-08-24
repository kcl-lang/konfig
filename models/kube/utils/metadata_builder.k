import models.kube.metadata

MetadataBuilder = lambda config -> {str:} {
    {
        name: config?.name or metadata.__META_APP_NAME
        namespace: config?.namespace or metadata.__META_APP_NAMESPACE
        # Workaround: provide explicit fallbacks for labels/annotations.
        # The bare `config?.labels` (no fallback) returns Undefined when
        # the attribute is absent. Combined with kcl 0.12.x's stricter
        # evaluation, the Undefined value leaks into the surrounding
        # dict literal and breaks sibling key reads (e.g. `config.X`
        # or `len(config.services)` after `MetadataBuilder(_) | {...}`
        # resolves to Undefined). Returning `{}` preserves K8s semantics
        # (labels/annotations should be a map, never None) and avoids
        # the bug.
        labels: config?.labels or {}
        annotations: config?.annotations or {}
    }
}
