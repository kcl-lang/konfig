import k8s.api.rbac.v1 as rbacv1
import models.kube.frontend.common
import models.kube.mixins

schema RoleBinding(common.Metadata):
    """
    subjects: [Subject], default is Undefined, optional
        Subjects holds references to the objects the role applies to.
    roleRef: RoleRef, default is Undefined, required
        RoleRef can only reference a ClusterRole in the global namespace. If the RoleRef cannot be resolved, the Authorizer must return an error.
    """
    mixin [
        mixins.MetadataMixin
    ]

    subjects?: [rbacv1.Subject]

    roleRef: rbacv1.RoleRef

    kubernetes: rbacv1.RoleBinding = rbacv1.RoleBinding {
        metadata = metadata
        subjects = subjects
        roleRef = roleRef
    }
