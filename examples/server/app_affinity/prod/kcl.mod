[package]
name = "app_affinity-prod"
version = "0.0.1"

[dependencies]
konfig = { path = "../../../../../konfig" }
k8s = "1.31.2"
[profile]
entries = ["../base/base.k", "main.k", "${konfig:KCL_MOD}/models/kube/render/render.k"]

