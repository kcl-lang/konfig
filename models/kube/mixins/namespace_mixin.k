import k8s.api.core.v1
import models.kube.metadata
import models.kube.resource
import models.kube.protocol

mixin NamespaceMixin for protocol.ServerProtocol:
    """NamespaceMixin encapsulate the logic of automatically creating a 
    namespace resource.

    Attributes
    ----------
    needNamespace: bool, default is False, optional.
        A Server-level attribute.
        Represents whether a namespace needs to be created.
        If not specified, default to False.

    Examples
    --------
    app = {
        needNamespace = True
    }
    """

    if config.needNamespace:
        kubernetes: resource.ResourceMapping {
            Namespace = [
                v1.Namespace {
                    metadata.name = metadata.__META_APP_NAME
                }
            ]
        }
