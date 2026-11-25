# Public names. KCL 0.13.1+ treats a leading underscore as module-private
# (kcl-lang/kcl#1576), and these values are read from other konfig modules.
META_APP_NAME = option("app") or option("params")?.app or "sampleapp"
META_APP_NAMESPACE = option("appns") or option("params")?.appns or "sampleappns"
META_ENV_TYPE_NAME = option("appenv") or option("params")?.appenv or "prod"
META_CLUSTER_NAME = option("appcluster") or option("params")?.appcluster or Undefined
