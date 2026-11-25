import k8s.api.core.v1
import models.kube.metadata
import models.kube.utils
import models.kube.resource
import models.kube.protocol

mixin ServiceMixin for protocol.ServerProtocol:
    if config.services:
        assert "workloadType" in config, "config must contain `workloadType` attribute"
        # Read config outside the dict that also contains `MetadataBuilder(_) | {...}`.
        # KCL 0.12.8 resolves those sibling reads to Undefined (kcl-lang/kcl#2130).
        _singleService: bool = len(config.services) == 1
        _workloadType: str = config.workloadType

        kubernetes: resource.ResourceMapping {
            Service = [v1.Service {
                metadata: utils.MetadataBuilder(_s) | {
                    name = _s?.name or (workloadName if _singleService else "{}-{}-{}".format(metadata.META_APP_NAME, metadata.META_ENV_TYPE_NAME, _i))
                    namespace = _s?.namespace or (workloadNamespace if _singleService else "{}-{}".format(metadata.META_APP_NAMESPACE, metadata.META_ENV_TYPE_NAME))
                }
                spec: {
                    clusterIP = _s?.clusterIP if _s?.type in ["ClusterIP", "NodePort", "LoadBalancer", None, Undefined] else Undefined
                    externalIPs = _s?.externalIPs
                    externalName = _s?.externalName if _s?.type == "ExternalName" else Undefined
                    externalTrafficPolicy = _s?.externalTrafficPolicy
                    healthCheckNodePort = _s?.healthCheckNodePort if _s?.type == "LoadBalancer" and _s?.externalTrafficPolicy == "Local" else Undefined
                    ipFamilyPolicy = _s?.ipFamilyPolicy
                    loadBalancerIP = _s?.loadBalancerIP if _s?.type == "LoadBalancer" else Undefined
                    loadBalancerSourceRanges = _s?.loadBalancerSourceRanges
                    ports = _s?.ports
                    publishNotReadyAddresses = _s?.publishNotReadyAddresses
                    selector = _s?.selector or kubernetes?[_workloadType]?[0]?.spec?.selector?.matchLabels
                    sessionAffinity = _s?.sessionAffinity
                    sessionAffinityConfig = _s?.sessionAffinityConfig if _s?.sessionAffinity == "ClientIP" else Undefined
                    type = _s?.type
                }
            } for _i, _s in config.services]
        }
