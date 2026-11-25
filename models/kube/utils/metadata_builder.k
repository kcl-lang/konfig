import models.kube.metadata

MetadataBuilder = lambda config -> {str:} {
    {
        name: config?.name or metadata.META_APP_NAME
        namespace: config?.namespace or metadata.META_APP_NAMESPACE
        labels: config?.labels
        annotations: config?.annotations
    }
}
