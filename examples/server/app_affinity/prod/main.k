import konfig.models.kube.frontend

# The application configuration in stack will overwrite 
# the configuration with the same attribute in base.
appConfiguration: frontend.Server {
    affinity: {
       podAntiAffinity: {
              requiredDuringSchedulingIgnoredDuringExecution: [{
                    labelSelector: {
                        matchExpressions: [{
                            key: "app",
                            operator: "In",
                            values: ["release-rest-server"]
                        }]
                    },
                    topologyKey: "kubernetes.io/hostname"
              }]
       }
    }
}
