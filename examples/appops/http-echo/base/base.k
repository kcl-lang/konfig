import konfig.models.kube.frontend
import konfig.models.kube.frontend.container
import konfig.models.kube.templates.resource as res_tpl
import konfig.models.kube.frontend.service
import konfig.models.kube.frontend.ingress

# Application Configuration
appConfiguration: frontend.Server {
    # Main Container Configuration
    mainContainer = container.Main {
        name = "apple-app"
        args = ["-text=apple"]
    }
    image = "hashicorp/http-echo"
    schedulingStrategy.resource = res_tpl.tiny
    services = [
        service.Service {
            name = "apple-service"
            type = "NodePort"
            ports = [{port = 5678}]
        }
    ]
    ingresses = [
        ingress.Ingress {
            name = "example-ingress"
            rules = [
                {
                    http.paths = [
                        {
                            path = "/apple"
                            pathType = "Prefix"
                            backend.service = {
                                name = "apple-service"
                                port = {number = 5678}
                            }
                        }
                    ]
                }
            ]
        }
    ]
}
