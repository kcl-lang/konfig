import konfig.models.kube.frontend

# The application configuration in stack will overwrite 
# the configuration with the same attribute in base.
appConfiguration: frontend.Server {
    deploymentStrategy: {
        type = "RollingUpdate"
        rollingUpdate: {
            maxSurge = 1
            maxUnavailable = 1
        }
    }
}
