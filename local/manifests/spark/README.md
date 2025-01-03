# spark

![Version: 9.3.2](https://img.shields.io/badge/Version-9.3.2-informational?style=flat-square) ![AppVersion: 3.5.4](https://img.shields.io/badge/AppVersion-3.5.4-informational?style=flat-square)

Apache Spark is a high-performance engine for large-scale computing tasks, such as data processing, machine learning and real-time data streaming. It includes APIs for Java, Python, Scala and R.

**Homepage:** <https://bitnami.com>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Broadcom, Inc. All Rights Reserved. |  | <https://github.com/bitnami/charts> |

## Source Code

* <https://github.com/bitnami/charts/tree/main/bitnami/spark>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://registry-1.docker.io/bitnamicharts | common | 2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| clusterDomain | string | `"cluster.local"` |  |
| commonAnnotations | object | `{}` |  |
| commonLabels | object | `{}` |  |
| diagnosticMode.args[0] | string | `"infinity"` |  |
| diagnosticMode.command[0] | string | `"sleep"` |  |
| diagnosticMode.enabled | bool | `false` |  |
| extraDeploy | list | `[]` |  |
| fullnameOverride | string | `""` |  |
| global.compatibility.openshift.adaptSecurityContext | string | `"auto"` |  |
| global.defaultStorageClass | string | `""` |  |
| global.imagePullSecrets | list | `[]` |  |
| global.imageRegistry | string | `""` |  |
| global.security.allowInsecureImages | bool | `false` |  |
| global.storageClass | string | `""` |  |
| hostNetwork | bool | `false` |  |
| image.debug | bool | `false` |  |
| image.digest | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.pullSecrets | list | `[]` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"bitnami/spark"` |  |
| image.tag | string | `"3.5.4-debian-12-r0"` |  |
| ingress.annotations | object | `{}` |  |
| ingress.apiVersion | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.extraHosts | list | `[]` |  |
| ingress.extraPaths | list | `[]` |  |
| ingress.extraRules | list | `[]` |  |
| ingress.extraTls | list | `[]` |  |
| ingress.hostname | string | `"spark.local"` |  |
| ingress.ingressClassName | string | `""` |  |
| ingress.path | string | `"/"` |  |
| ingress.pathType | string | `"ImplementationSpecific"` |  |
| ingress.secrets | list | `[]` |  |
| ingress.selfSigned | bool | `false` |  |
| ingress.tls | bool | `false` |  |
| initScripts | object | `{}` |  |
| initScriptsCM | string | `""` |  |
| initScriptsSecret | string | `""` |  |
| kubeVersion | string | `""` |  |
| master.affinity | object | `{}` |  |
| master.args | list | `[]` |  |
| master.automountServiceAccountToken | bool | `false` |  |
| master.command | list | `[]` |  |
| master.configOptions | string | `""` |  |
| master.containerPorts.cluster | int | `7077` |  |
| master.containerPorts.http | int | `8080` |  |
| master.containerPorts.https | int | `8480` |  |
| master.containerSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| master.containerSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
| master.containerSecurityContext.enabled | bool | `true` |  |
| master.containerSecurityContext.privileged | bool | `false` |  |
| master.containerSecurityContext.readOnlyRootFilesystem | bool | `true` |  |
| master.containerSecurityContext.runAsGroup | int | `1001` |  |
| master.containerSecurityContext.runAsNonRoot | bool | `true` |  |
| master.containerSecurityContext.runAsUser | int | `1001` |  |
| master.containerSecurityContext.seLinuxOptions | object | `{}` |  |
| master.containerSecurityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| master.customLivenessProbe | object | `{}` |  |
| master.customReadinessProbe | object | `{}` |  |
| master.customStartupProbe | object | `{}` |  |
| master.daemonMemoryLimit | string | `""` |  |
| master.existingConfigmap | string | `""` |  |
| master.extraContainerPorts | list | `[]` |  |
| master.extraEnvVars | list | `[]` |  |
| master.extraEnvVarsCM | string | `""` |  |
| master.extraEnvVarsSecret | string | `""` |  |
| master.extraVolumeClaimTemplates | list | `[]` |  |
| master.extraVolumeMounts | list | `[]` |  |
| master.extraVolumes | list | `[]` |  |
| master.hostAliases | list | `[]` |  |
| master.initContainers | list | `[]` |  |
| master.lifecycleHooks | object | `{}` |  |
| master.livenessProbe.enabled | bool | `true` |  |
| master.livenessProbe.failureThreshold | int | `6` |  |
| master.livenessProbe.initialDelaySeconds | int | `180` |  |
| master.livenessProbe.periodSeconds | int | `20` |  |
| master.livenessProbe.successThreshold | int | `1` |  |
| master.livenessProbe.timeoutSeconds | int | `5` |  |
| master.networkPolicy.allowExternal | bool | `true` |  |
| master.networkPolicy.allowExternalEgress | bool | `true` |  |
| master.networkPolicy.enabled | bool | `true` |  |
| master.networkPolicy.extraEgress | list | `[]` |  |
| master.networkPolicy.extraIngress | list | `[]` |  |
| master.networkPolicy.ingressNSMatchLabels | object | `{}` |  |
| master.networkPolicy.ingressNSPodMatchLabels | object | `{}` |  |
| master.nodeAffinityPreset.key | string | `""` |  |
| master.nodeAffinityPreset.type | string | `""` |  |
| master.nodeAffinityPreset.values | list | `[]` |  |
| master.nodeSelector | object | `{}` |  |
| master.pdb.create | bool | `true` |  |
| master.pdb.maxUnavailable | string | `""` |  |
| master.pdb.minAvailable | string | `""` |  |
| master.podAffinityPreset | string | `""` |  |
| master.podAnnotations | object | `{}` |  |
| master.podAntiAffinityPreset | string | `"soft"` |  |
| master.podLabels | object | `{}` |  |
| master.podSecurityContext.enabled | bool | `true` |  |
| master.podSecurityContext.fsGroup | int | `1001` |  |
| master.podSecurityContext.fsGroupChangePolicy | string | `"Always"` |  |
| master.podSecurityContext.supplementalGroups | list | `[]` |  |
| master.podSecurityContext.sysctls | list | `[]` |  |
| master.priorityClassName | string | `""` |  |
| master.readinessProbe.enabled | bool | `true` |  |
| master.readinessProbe.failureThreshold | int | `6` |  |
| master.readinessProbe.initialDelaySeconds | int | `30` |  |
| master.readinessProbe.periodSeconds | int | `10` |  |
| master.readinessProbe.successThreshold | int | `1` |  |
| master.readinessProbe.timeoutSeconds | int | `5` |  |
| master.resources | object | `{}` |  |
| master.resourcesPreset | string | `"small"` |  |
| master.schedulerName | string | `""` |  |
| master.sidecars | list | `[]` |  |
| master.startupProbe.enabled | bool | `false` |  |
| master.startupProbe.failureThreshold | int | `6` |  |
| master.startupProbe.initialDelaySeconds | int | `30` |  |
| master.startupProbe.periodSeconds | int | `10` |  |
| master.startupProbe.successThreshold | int | `1` |  |
| master.startupProbe.timeoutSeconds | int | `5` |  |
| master.terminationGracePeriodSeconds | string | `""` |  |
| master.tolerations | list | `[]` |  |
| master.topologySpreadConstraints | list | `[]` |  |
| master.updateStrategy.type | string | `"RollingUpdate"` |  |
| metrics.enabled | bool | `false` |  |
| metrics.masterAnnotations."prometheus.io/path" | string | `"/metrics/"` |  |
| metrics.masterAnnotations."prometheus.io/port" | string | `"{{ .Values.master.containerPorts.http }}"` |  |
| metrics.masterAnnotations."prometheus.io/scrape" | string | `"true"` |  |
| metrics.podMonitor.additionalLabels | object | `{}` |  |
| metrics.podMonitor.enabled | bool | `false` |  |
| metrics.podMonitor.extraMetricsEndpoints | list | `[]` |  |
| metrics.podMonitor.interval | string | `"30s"` |  |
| metrics.podMonitor.namespace | string | `""` |  |
| metrics.podMonitor.scrapeTimeout | string | `""` |  |
| metrics.prometheusRule.additionalLabels | object | `{}` |  |
| metrics.prometheusRule.enabled | bool | `false` |  |
| metrics.prometheusRule.namespace | string | `""` |  |
| metrics.prometheusRule.rules | list | `[]` |  |
| metrics.workerAnnotations."prometheus.io/path" | string | `"/metrics/"` |  |
| metrics.workerAnnotations."prometheus.io/port" | string | `"{{ .Values.worker.containerPorts.http }}"` |  |
| metrics.workerAnnotations."prometheus.io/scrape" | string | `"true"` |  |
| nameOverride | string | `""` |  |
| namespaceOverride | string | `""` |  |
| security.certificatesSecretName | string | `""` |  |
| security.passwordsSecretName | string | `""` |  |
| security.rpc.authenticationEnabled | bool | `false` |  |
| security.rpc.encryptionEnabled | bool | `false` |  |
| security.ssl.autoGenerated | bool | `false` |  |
| security.ssl.enabled | bool | `false` |  |
| security.ssl.existingSecret | string | `""` |  |
| security.ssl.keystorePassword | string | `""` |  |
| security.ssl.needClientAuth | bool | `false` |  |
| security.ssl.protocol | string | `"TLSv1.2"` |  |
| security.ssl.resources | object | `{}` |  |
| security.ssl.resourcesPreset | string | `"small"` |  |
| security.ssl.truststorePassword | string | `""` |  |
| security.storageEncryptionEnabled | bool | `false` |  |
| service.annotations | object | `{}` |  |
| service.clusterIP | string | `""` |  |
| service.externalTrafficPolicy | string | `"Cluster"` |  |
| service.extraPorts | list | `[]` |  |
| service.headless.annotations | object | `{}` |  |
| service.loadBalancerIP | string | `""` |  |
| service.loadBalancerSourceRanges | list | `[]` |  |
| service.nodePorts.cluster | string | `""` |  |
| service.nodePorts.http | string | `""` |  |
| service.nodePorts.https | string | `""` |  |
| service.ports.cluster | int | `7077` |  |
| service.ports.http | int | `80` |  |
| service.ports.https | int | `443` |  |
| service.sessionAffinity | string | `"None"` |  |
| service.sessionAffinityConfig | object | `{}` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automountServiceAccountToken | bool | `false` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| worker.affinity | object | `{}` |  |
| worker.args | list | `[]` |  |
| worker.automountServiceAccountToken | bool | `false` |  |
| worker.autoscaling.enabled | bool | `false` |  |
| worker.autoscaling.maxReplicas | int | `5` |  |
| worker.autoscaling.minReplicas | string | `""` |  |
| worker.autoscaling.targetCPU | int | `50` |  |
| worker.autoscaling.targetMemory | string | `""` |  |
| worker.command | list | `[]` |  |
| worker.configOptions | string | `""` |  |
| worker.containerPorts.cluster | string | `""` |  |
| worker.containerPorts.http | int | `8080` |  |
| worker.containerPorts.https | int | `8480` |  |
| worker.containerSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| worker.containerSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
| worker.containerSecurityContext.enabled | bool | `true` |  |
| worker.containerSecurityContext.privileged | bool | `false` |  |
| worker.containerSecurityContext.readOnlyRootFilesystem | bool | `true` |  |
| worker.containerSecurityContext.runAsGroup | int | `1001` |  |
| worker.containerSecurityContext.runAsNonRoot | bool | `true` |  |
| worker.containerSecurityContext.runAsUser | int | `1001` |  |
| worker.containerSecurityContext.seLinuxOptions | object | `{}` |  |
| worker.containerSecurityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| worker.coreLimit | string | `""` |  |
| worker.customLivenessProbe | object | `{}` |  |
| worker.customReadinessProbe | object | `{}` |  |
| worker.customStartupProbe | object | `{}` |  |
| worker.daemonMemoryLimit | string | `""` |  |
| worker.dir | string | `""` |  |
| worker.existingConfigmap | string | `""` |  |
| worker.extraContainerPorts | list | `[]` |  |
| worker.extraEnvVars | list | `[]` |  |
| worker.extraEnvVarsCM | string | `""` |  |
| worker.extraEnvVarsSecret | string | `""` |  |
| worker.extraVolumeClaimTemplates | list | `[]` |  |
| worker.extraVolumeMounts | list | `[]` |  |
| worker.extraVolumes | list | `[]` |  |
| worker.hostAliases | list | `[]` |  |
| worker.initContainers | list | `[]` |  |
| worker.javaOptions | string | `""` |  |
| worker.lifecycleHooks | object | `{}` |  |
| worker.livenessProbe.enabled | bool | `true` |  |
| worker.livenessProbe.failureThreshold | int | `6` |  |
| worker.livenessProbe.initialDelaySeconds | int | `180` |  |
| worker.livenessProbe.periodSeconds | int | `20` |  |
| worker.livenessProbe.successThreshold | int | `1` |  |
| worker.livenessProbe.timeoutSeconds | int | `5` |  |
| worker.memoryLimit | string | `""` |  |
| worker.networkPolicy.allowExternal | bool | `true` |  |
| worker.networkPolicy.allowExternalEgress | bool | `true` |  |
| worker.networkPolicy.enabled | bool | `true` |  |
| worker.networkPolicy.extraEgress | list | `[]` |  |
| worker.networkPolicy.extraIngress | list | `[]` |  |
| worker.networkPolicy.ingressNSMatchLabels | object | `{}` |  |
| worker.networkPolicy.ingressNSPodMatchLabels | object | `{}` |  |
| worker.nodeAffinityPreset.key | string | `""` |  |
| worker.nodeAffinityPreset.type | string | `""` |  |
| worker.nodeAffinityPreset.values | list | `[]` |  |
| worker.nodeSelector | object | `{}` |  |
| worker.pdb.create | bool | `true` |  |
| worker.pdb.maxUnavailable | string | `""` |  |
| worker.pdb.minAvailable | string | `""` |  |
| worker.podAffinityPreset | string | `""` |  |
| worker.podAnnotations | object | `{}` |  |
| worker.podAntiAffinityPreset | string | `"soft"` |  |
| worker.podLabels | object | `{}` |  |
| worker.podManagementPolicy | string | `"OrderedReady"` |  |
| worker.podSecurityContext.enabled | bool | `true` |  |
| worker.podSecurityContext.fsGroup | int | `1001` |  |
| worker.podSecurityContext.fsGroupChangePolicy | string | `"Always"` |  |
| worker.podSecurityContext.seLinuxOptions | object | `{}` |  |
| worker.podSecurityContext.supplementalGroups | list | `[]` |  |
| worker.podSecurityContext.sysctls | list | `[]` |  |
| worker.priorityClassName | string | `""` |  |
| worker.readinessProbe.enabled | bool | `true` |  |
| worker.readinessProbe.failureThreshold | int | `6` |  |
| worker.readinessProbe.initialDelaySeconds | int | `30` |  |
| worker.readinessProbe.periodSeconds | int | `10` |  |
| worker.readinessProbe.successThreshold | int | `1` |  |
| worker.readinessProbe.timeoutSeconds | int | `5` |  |
| worker.replicaCount | int | `2` |  |
| worker.resources | object | `{}` |  |
| worker.resourcesPreset | string | `"small"` |  |
| worker.schedulerName | string | `""` |  |
| worker.sidecars | list | `[]` |  |
| worker.startupProbe.enabled | bool | `true` |  |
| worker.startupProbe.failureThreshold | int | `6` |  |
| worker.startupProbe.initialDelaySeconds | int | `30` |  |
| worker.startupProbe.periodSeconds | int | `10` |  |
| worker.startupProbe.successThreshold | int | `1` |  |
| worker.startupProbe.timeoutSeconds | int | `5` |  |
| worker.terminationGracePeriodSeconds | string | `""` |  |
| worker.tolerations | list | `[]` |  |
| worker.topologySpreadConstraints | list | `[]` |  |
| worker.updateStrategy.type | string | `"RollingUpdate"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
