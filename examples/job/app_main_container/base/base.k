import konfig.models.kube.frontend
import konfig.models.kube.frontend.container

# Application Configuration
appConfiguration: frontend.Job {
    # Main Container Configuration
    mainContainer = container.Main {
        ports = [
            {containerPort = 80}
        ]
        env.MY_ENV: {
            value = "MY_VALUE"
        }
    }
    image = "nginx:1.7.8"
}
