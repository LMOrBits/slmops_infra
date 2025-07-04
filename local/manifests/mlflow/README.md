# mlflow

![Version: 2.3.1](https://img.shields.io/badge/Version-2.3.1-informational?style=flat-square) ![AppVersion: 2.19.0](https://img.shields.io/badge/AppVersion-2.19.0-informational?style=flat-square)

MLflow is an open-source platform designed to manage the end-to-end machine learning lifecycle. It allows you to track experiments, package code into reproducible runs, and share and deploy models.

**Homepage:** <https://bitnami.com>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Broadcom, Inc. All Rights Reserved. |  | <https://github.com/bitnami/charts> |

## Source Code

* <https://github.com/bitnami/charts/tree/main/bitnami/mlflow>
* <https://github.com/bitnami/containers/tree/main/bitnami/mlflow>
* <https://github.com/mlflow/mlflow>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://registry-1.docker.io/bitnamicharts | common | 2.x.x |
| oci://registry-1.docker.io/bitnamicharts | minio | 14.x.x |
| oci://registry-1.docker.io/bitnamicharts | postgresql | 16.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| clusterDomain | string | `"cluster.local"` |  |
| commonAnnotations | object | `{}` |  |
| commonLabels | object | `{}` |  |
| diagnosticMode.args[0] | string | `"infinity"` |  |
| diagnosticMode.command[0] | string | `"sleep"` |  |
| diagnosticMode.enabled | bool | `false` |  |
| externalAzureBlob.accessKey | string | `""` |  |
| externalAzureBlob.clientId | string | `""` |  |
| externalAzureBlob.clientSecret | string | `""` |  |
| externalAzureBlob.clientSecretKey | string | `""` |  |
| externalAzureBlob.connectionString | string | `""` |  |
| externalAzureBlob.containerName | string | `"mlflow"` |  |
| externalAzureBlob.existingAccessKeyKey | string | `""` |  |
| externalAzureBlob.existingConnectionStringKey | string | `""` |  |
| externalAzureBlob.existingSecret | string | `""` |  |
| externalAzureBlob.serveArtifacts | bool | `true` |  |
| externalAzureBlob.storageAccount | string | `""` |  |
| externalAzureBlob.tenantId | string | `""` |  |
| externalAzureBlob.useCredentialsInSecret | bool | `false` |  |
| externalDatabase.authDatabase | string | `"mlflow_auth"` |  |
| externalDatabase.database | string | `"mlflow"` |  |
| externalDatabase.dialectDriver | string | `"postgresql"` |  |
| externalDatabase.existingSecret | string | `""` |  |
| externalDatabase.existingSecretPasswordKey | string | `"db-password"` |  |
| externalDatabase.host | string | `""` |  |
| externalDatabase.password | string | `""` |  |
| externalDatabase.port | int | `5432` |  |
| externalDatabase.user | string | `"postgres"` |  |
| externalGCS.bucket | string | `""` |  |
| externalGCS.existingSecret | string | `""` |  |
| externalGCS.existingSecretKey | string | `""` |  |
| externalGCS.googleCloudProject | string | `""` |  |
| externalGCS.serveArtifacts | bool | `true` |  |
| externalGCS.useCredentialsInSecret | bool | `false` |  |
| externalS3.accessKeyID | string | `""` |  |
| externalS3.accessKeySecret | string | `""` |  |
| externalS3.bucket | string | `"mlflow"` |  |
| externalS3.existingSecret | string | `""` |  |
| externalS3.existingSecretAccessKeyIDKey | string | `"root-user"` |  |
| externalS3.existingSecretKeySecretKey | string | `"root-password"` |  |
| externalS3.host | string | `""` |  |
| externalS3.port | int | `443` |  |
| externalS3.protocol | string | `"https"` |  |
| externalS3.serveArtifacts | bool | `true` |  |
| externalS3.useCredentialsInSecret | bool | `true` |  |
| extraDeploy | list | `[]` |  |
| fullnameOverride | string | `""` |  |
| gitImage.digest | string | `""` |  |
| gitImage.pullPolicy | string | `"IfNotPresent"` |  |
| gitImage.pullSecrets | list | `[]` |  |
| gitImage.registry | string | `"docker.io"` |  |
| gitImage.repository | string | `"bitnami/git"` |  |
| gitImage.tag | string | `"2.47.1-debian-12-r0"` |  |
| global.compatibility.openshift.adaptSecurityContext | string | `"auto"` |  |
| global.defaultStorageClass | string | `""` |  |
| global.imagePullSecrets | list | `[]` |  |
| global.imageRegistry | string | `""` |  |
| global.security.allowInsecureImages | bool | `false` |  |
| global.storageClass | string | `""` |  |
| image.debug | bool | `false` |  |
| image.digest | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.pullSecrets | list | `[]` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"bitnami/mlflow"` |  |
| image.tag | string | `"2.19.0-debian-12-r0"` |  |
| kubeVersion | string | `""` |  |
| minio.auth.existingSecret | string | `""` |  |
| minio.auth.rootPassword | string | `""` |  |
| minio.auth.rootUser | string | `"admin"` |  |
| minio.defaultBuckets | string | `"mlflow"` |  |
| minio.enabled | bool | `true` |  |
| minio.provisioning.enabled | bool | `true` |  |
| minio.provisioning.extraCommands[0] | string | `"mc anonymous set download provisioning/mlflow"` |  |
| minio.service.loadBalancerIP | string | `""` |  |
| minio.service.ports.api | int | `80` |  |
| minio.service.type | string | `"ClusterIP"` |  |
| minio.tls.enabled | bool | `false` |  |
| nameOverride | string | `""` |  |
| namespaceOverride | string | `""` |  |
| postgresql.architecture | string | `"standalone"` |  |
| postgresql.auth.database | string | `"bitnami_mlflow"` |  |
| postgresql.auth.existingSecret | string | `""` |  |
| postgresql.auth.password | string | `""` |  |
| postgresql.auth.username | string | `"bn_mlflow"` |  |
| postgresql.enabled | bool | `true` |  |
| postgresql.primary.initdb.scripts."create_auth_db.sh" | string | `"#!/bin/bash\nPGPASSWORD=$POSTGRES_POSTGRES_PASSWORD psql -U postgres <<< \"CREATE DATABASE {{ include \"mlflow.v0.database-auth.name\" . }}\"\nPGPASSWORD=$POSTGRES_POSTGRES_PASSWORD psql -U postgres <<< \"GRANT ALL PRIVILEGES ON DATABASE {{ include \"mlflow.v0.database-auth.name\" . }} to {{ .Values.auth.username }}\"\nPGPASSWORD=$POSTGRES_POSTGRES_PASSWORD psql -U postgres <<< \"ALTER DATABASE {{ include \"mlflow.v0.database-auth.name\" . }} OWNER TO {{ .Values.auth.username }}\"\n"` |  |
| postgresql.primary.service.ports.postgresql | int | `5432` |  |
| run.affinity | object | `{}` |  |
| run.annotations | object | `{}` |  |
| run.args | list | `[]` |  |
| run.automountServiceAccountToken | bool | `false` |  |
| run.backoffLimit | int | `10` |  |
| run.command | list | `[]` |  |
| run.containerSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| run.containerSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
| run.containerSecurityContext.enabled | bool | `true` |  |
| run.containerSecurityContext.privileged | bool | `false` |  |
| run.containerSecurityContext.readOnlyRootFilesystem | bool | `true` |  |
| run.containerSecurityContext.runAsGroup | int | `1001` |  |
| run.containerSecurityContext.runAsNonRoot | bool | `true` |  |
| run.containerSecurityContext.runAsUser | int | `1001` |  |
| run.containerSecurityContext.seLinuxOptions | object | `{}` |  |
| run.containerSecurityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| run.customLivenessProbe | object | `{}` |  |
| run.customReadinessProbe | object | `{}` |  |
| run.customStartupProbe | object | `{}` |  |
| run.enableDefaultInitContainers | bool | `true` |  |
| run.enabled | bool | `true` |  |
| run.extraEnvVars | list | `[]` |  |
| run.extraEnvVarsCM | string | `""` |  |
| run.extraEnvVarsSecret | string | `""` |  |
| run.extraVolumeMounts | list | `[]` |  |
| run.extraVolumes | list | `[]` |  |
| run.hostAliases | list | `[]` |  |
| run.initContainers | list | `[]` |  |
| run.labels | object | `{}` |  |
| run.lifecycleHooks | object | `{}` |  |
| run.networkPolicy.allowExternal | bool | `true` |  |
| run.networkPolicy.allowExternalEgress | bool | `true` |  |
| run.networkPolicy.enabled | bool | `true` |  |
| run.networkPolicy.extraEgress | list | `[]` |  |
| run.networkPolicy.extraIngress | list | `[]` |  |
| run.networkPolicy.ingressNSMatchLabels | object | `{}` |  |
| run.networkPolicy.ingressNSPodMatchLabels | object | `{}` |  |
| run.nodeAffinityPreset.key | string | `""` |  |
| run.nodeAffinityPreset.type | string | `""` |  |
| run.nodeAffinityPreset.values | list | `[]` |  |
| run.nodeSelector | object | `{}` |  |
| run.persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| run.persistence.annotations | object | `{}` |  |
| run.persistence.dataSource | object | `{}` |  |
| run.persistence.enabled | bool | `false` |  |
| run.persistence.existingClaim | string | `""` |  |
| run.persistence.labels | object | `{}` |  |
| run.persistence.mountPath | string | `"/bitnami/mlflow/data"` |  |
| run.persistence.selector | object | `{}` |  |
| run.persistence.size | string | `"8Gi"` |  |
| run.persistence.storageClass | string | `""` |  |
| run.persistence.subPath | string | `""` |  |
| run.podAffinityPreset | string | `""` |  |
| run.podAnnotations | object | `{}` |  |
| run.podAntiAffinityPreset | string | `"soft"` |  |
| run.podLabels | object | `{}` |  |
| run.podSecurityContext.enabled | bool | `true` |  |
| run.podSecurityContext.fsGroup | int | `1001` |  |
| run.podSecurityContext.fsGroupChangePolicy | string | `"Always"` |  |
| run.podSecurityContext.supplementalGroups | list | `[]` |  |
| run.podSecurityContext.sysctls | list | `[]` |  |
| run.priorityClassName | string | `""` |  |
| run.resources | object | `{}` |  |
| run.resourcesPreset | string | `"small"` |  |
| run.restartPolicy | string | `"OnFailure"` |  |
| run.runtimeClassName | string | `""` |  |
| run.schedulerName | string | `""` |  |
| run.serviceAccount.annotations | object | `{}` |  |
| run.serviceAccount.automountServiceAccountToken | bool | `false` |  |
| run.serviceAccount.create | bool | `true` |  |
| run.serviceAccount.name | string | `""` |  |
| run.sidecars | list | `[]` |  |
| run.source.configMap | object | `{}` |  |
| run.source.existingConfigMap | string | `""` |  |
| run.source.git.extraVolumeMounts | list | `[]` |  |
| run.source.git.repository | string | `""` |  |
| run.source.git.revision | string | `""` |  |
| run.source.launchCommand | string | `""` |  |
| run.source.type | string | `"configmap"` |  |
| run.terminationGracePeriodSeconds | string | `""` |  |
| run.tolerations | list | `[]` |  |
| run.topologySpreadConstraints | list | `[]` |  |
| run.updateStrategy.rollingUpdate | object | `{}` |  |
| run.updateStrategy.type | string | `"RollingUpdate"` |  |
| run.useJob | bool | `false` |  |
| tracking.affinity | object | `{}` |  |
| tracking.args | list | `[]` |  |
| tracking.auth.enabled | bool | `true` |  |
| tracking.auth.existingSecret | string | `""` |  |
| tracking.auth.existingSecretPasswordKey | string | `""` |  |
| tracking.auth.existingSecretUserKey | string | `""` |  |
| tracking.auth.extraOverrides | object | `{}` |  |
| tracking.auth.overridesConfigMap | string | `""` |  |
| tracking.auth.password | string | `""` |  |
| tracking.auth.username | string | `"user"` |  |
| tracking.automountServiceAccountToken | bool | `false` |  |
| tracking.autoscaling.hpa.enabled | bool | `false` |  |
| tracking.autoscaling.hpa.maxReplicas | string | `""` |  |
| tracking.autoscaling.hpa.minReplicas | string | `""` |  |
| tracking.autoscaling.hpa.targetCPU | string | `""` |  |
| tracking.autoscaling.hpa.targetMemory | string | `""` |  |
| tracking.autoscaling.vpa.annotations | object | `{}` |  |
| tracking.autoscaling.vpa.controlledResources | list | `[]` |  |
| tracking.autoscaling.vpa.enabled | bool | `false` |  |
| tracking.autoscaling.vpa.maxAllowed | object | `{}` |  |
| tracking.autoscaling.vpa.minAllowed | object | `{}` |  |
| tracking.autoscaling.vpa.updatePolicy.updateMode | string | `"Auto"` |  |
| tracking.command | list | `[]` |  |
| tracking.containerPorts.http | int | `5000` |  |
| tracking.containerSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| tracking.containerSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
| tracking.containerSecurityContext.enabled | bool | `true` |  |
| tracking.containerSecurityContext.privileged | bool | `false` |  |
| tracking.containerSecurityContext.readOnlyRootFilesystem | bool | `true` |  |
| tracking.containerSecurityContext.runAsGroup | int | `1001` |  |
| tracking.containerSecurityContext.runAsNonRoot | bool | `true` |  |
| tracking.containerSecurityContext.runAsUser | int | `1001` |  |
| tracking.containerSecurityContext.seLinuxOptions | object | `{}` |  |
| tracking.containerSecurityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| tracking.customLivenessProbe | object | `{}` |  |
| tracking.customReadinessProbe | object | `{}` |  |
| tracking.customStartupProbe | object | `{}` |  |
| tracking.enableDefaultInitContainers | bool | `true` |  |
| tracking.enabled | bool | `true` |  |
| tracking.extraArgs | list | `[]` |  |
| tracking.extraEnvVars | list | `[]` |  |
| tracking.extraEnvVarsCM | string | `""` |  |
| tracking.extraEnvVarsSecret | string | `""` |  |
| tracking.extraVolumeMounts | list | `[]` |  |
| tracking.extraVolumes | list | `[]` |  |
| tracking.host | string | `"0.0.0.0"` |  |
| tracking.hostAliases | list | `[]` |  |
| tracking.ingress.annotations | object | `{}` |  |
| tracking.ingress.enabled | bool | `false` |  |
| tracking.ingress.extraHosts | list | `[]` |  |
| tracking.ingress.extraPaths | list | `[]` |  |
| tracking.ingress.extraRules | list | `[]` |  |
| tracking.ingress.extraTls | list | `[]` |  |
| tracking.ingress.hostname | string | `"mlflow.local"` |  |
| tracking.ingress.ingressClassName | string | `""` |  |
| tracking.ingress.path | string | `"/"` |  |
| tracking.ingress.pathType | string | `"ImplementationSpecific"` |  |
| tracking.ingress.secrets | list | `[]` |  |
| tracking.ingress.selfSigned | bool | `false` |  |
| tracking.ingress.tls | bool | `false` |  |
| tracking.initContainers | list | `[]` |  |
| tracking.lifecycleHooks | object | `{}` |  |
| tracking.livenessProbe.enabled | bool | `true` |  |
| tracking.livenessProbe.failureThreshold | int | `5` |  |
| tracking.livenessProbe.initialDelaySeconds | int | `5` |  |
| tracking.livenessProbe.periodSeconds | int | `10` |  |
| tracking.livenessProbe.successThreshold | int | `1` |  |
| tracking.livenessProbe.timeoutSeconds | int | `5` |  |
| tracking.metrics.annotations."prometheus.io/port" | string | `"{{ .Values.tracking.service.ports.http }}"` |  |
| tracking.metrics.annotations."prometheus.io/scrape" | string | `"true"` |  |
| tracking.metrics.enabled | bool | `false` |  |
| tracking.metrics.serviceMonitor.annotations | object | `{}` |  |
| tracking.metrics.serviceMonitor.enabled | bool | `false` |  |
| tracking.metrics.serviceMonitor.honorLabels | bool | `false` |  |
| tracking.metrics.serviceMonitor.interval | string | `""` |  |
| tracking.metrics.serviceMonitor.jobLabel | string | `""` |  |
| tracking.metrics.serviceMonitor.labels | object | `{}` |  |
| tracking.metrics.serviceMonitor.metricRelabelings | list | `[]` |  |
| tracking.metrics.serviceMonitor.namespace | string | `""` |  |
| tracking.metrics.serviceMonitor.relabelings | list | `[]` |  |
| tracking.metrics.serviceMonitor.scrapeTimeout | string | `""` |  |
| tracking.metrics.serviceMonitor.selector | object | `{}` |  |
| tracking.networkPolicy.allowExternal | bool | `true` |  |
| tracking.networkPolicy.allowExternalEgress | bool | `true` |  |
| tracking.networkPolicy.enabled | bool | `true` |  |
| tracking.networkPolicy.extraEgress | list | `[]` |  |
| tracking.networkPolicy.extraIngress | list | `[]` |  |
| tracking.networkPolicy.ingressNSMatchLabels | object | `{}` |  |
| tracking.networkPolicy.ingressNSPodMatchLabels | object | `{}` |  |
| tracking.nodeAffinityPreset.key | string | `""` |  |
| tracking.nodeAffinityPreset.type | string | `""` |  |
| tracking.nodeAffinityPreset.values | list | `[]` |  |
| tracking.nodeSelector | object | `{}` |  |
| tracking.pdb.create | bool | `true` |  |
| tracking.pdb.maxUnavailable | string | `""` |  |
| tracking.pdb.minAvailable | string | `""` |  |
| tracking.persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| tracking.persistence.annotations | object | `{}` |  |
| tracking.persistence.dataSource | object | `{}` |  |
| tracking.persistence.enabled | bool | `true` |  |
| tracking.persistence.existingClaim | string | `""` |  |
| tracking.persistence.labels | object | `{}` |  |
| tracking.persistence.mountPath | string | `"/bitnami/mlflow"` |  |
| tracking.persistence.selector | object | `{}` |  |
| tracking.persistence.size | string | `"8Gi"` |  |
| tracking.persistence.storageClass | string | `""` |  |
| tracking.persistence.subPath | string | `""` |  |
| tracking.podAffinityPreset | string | `""` |  |
| tracking.podAnnotations | object | `{}` |  |
| tracking.podAntiAffinityPreset | string | `"soft"` |  |
| tracking.podLabels | object | `{}` |  |
| tracking.podSecurityContext.enabled | bool | `true` |  |
| tracking.podSecurityContext.fsGroup | int | `1001` |  |
| tracking.podSecurityContext.fsGroupChangePolicy | string | `"Always"` |  |
| tracking.podSecurityContext.supplementalGroups | list | `[]` |  |
| tracking.podSecurityContext.sysctls | list | `[]` |  |
| tracking.priorityClassName | string | `""` |  |
| tracking.readinessProbe.enabled | bool | `true` |  |
| tracking.readinessProbe.failureThreshold | int | `5` |  |
| tracking.readinessProbe.initialDelaySeconds | int | `5` |  |
| tracking.readinessProbe.periodSeconds | int | `10` |  |
| tracking.readinessProbe.successThreshold | int | `1` |  |
| tracking.readinessProbe.timeoutSeconds | int | `5` |  |
| tracking.replicaCount | int | `1` |  |
| tracking.resources | object | `{}` |  |
| tracking.resourcesPreset | string | `"medium"` |  |
| tracking.runUpgradeDB | bool | `false` |  |
| tracking.schedulerName | string | `""` |  |
| tracking.service.annotations | object | `{}` |  |
| tracking.service.clusterIP | string | `""` |  |
| tracking.service.externalTrafficPolicy | string | `"Cluster"` |  |
| tracking.service.extraPorts | list | `[]` |  |
| tracking.service.labels | object | `{}` |  |
| tracking.service.loadBalancerIP | string | `""` |  |
| tracking.service.loadBalancerSourceRanges | list | `[]` |  |
| tracking.service.nodePorts.http | string | `""` |  |
| tracking.service.nodePorts.https | string | `""` |  |
| tracking.service.ports.http | int | `80` |  |
| tracking.service.ports.https | int | `443` |  |
| tracking.service.sessionAffinity | string | `"None"` |  |
| tracking.service.sessionAffinityConfig | object | `{}` |  |
| tracking.service.type | string | `"LoadBalancer"` |  |
| tracking.serviceAccount.annotations | object | `{}` |  |
| tracking.serviceAccount.automountServiceAccountToken | bool | `false` |  |
| tracking.serviceAccount.create | bool | `true` |  |
| tracking.serviceAccount.name | string | `""` |  |
| tracking.sidecars | list | `[]` |  |
| tracking.startupProbe.enabled | bool | `false` |  |
| tracking.startupProbe.failureThreshold | int | `5` |  |
| tracking.startupProbe.initialDelaySeconds | int | `5` |  |
| tracking.startupProbe.periodSeconds | int | `10` |  |
| tracking.startupProbe.successThreshold | int | `1` |  |
| tracking.startupProbe.timeoutSeconds | int | `5` |  |
| tracking.terminationGracePeriodSeconds | string | `""` |  |
| tracking.tls.autoGenerated | bool | `false` |  |
| tracking.tls.certCAFilename | string | `""` |  |
| tracking.tls.certFilename | string | `""` |  |
| tracking.tls.certKeyFilename | string | `""` |  |
| tracking.tls.certificatesSecret | string | `""` |  |
| tracking.tls.enabled | bool | `false` |  |
| tracking.tolerations | list | `[]` |  |
| tracking.topologySpreadConstraints | list | `[]` |  |
| tracking.updateStrategy.type | string | `"RollingUpdate"` |  |
| volumePermissions.containerSecurityContext.enabled | bool | `true` |  |
| volumePermissions.containerSecurityContext.runAsUser | int | `0` |  |
| volumePermissions.containerSecurityContext.seLinuxOptions | object | `{}` |  |
| volumePermissions.enabled | bool | `false` |  |
| volumePermissions.image.pullPolicy | string | `"IfNotPresent"` |  |
| volumePermissions.image.pullSecrets | list | `[]` |  |
| volumePermissions.image.registry | string | `"docker.io"` |  |
| volumePermissions.image.repository | string | `"bitnami/os-shell"` |  |
| volumePermissions.image.tag | string | `"12-debian-12-r34"` |  |
| volumePermissions.resources | object | `{}` |  |
| volumePermissions.resourcesPreset | string | `"nano"` |  |
| waitContainer.containerSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| waitContainer.containerSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
| waitContainer.containerSecurityContext.enabled | bool | `true` |  |
| waitContainer.containerSecurityContext.privileged | bool | `false` |  |
| waitContainer.containerSecurityContext.readOnlyRootFilesystem | bool | `true` |  |
| waitContainer.containerSecurityContext.runAsGroup | int | `1001` |  |
| waitContainer.containerSecurityContext.runAsNonRoot | bool | `true` |  |
| waitContainer.containerSecurityContext.runAsUser | int | `1001` |  |
| waitContainer.containerSecurityContext.seLinuxOptions | object | `{}` |  |
| waitContainer.containerSecurityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| waitContainer.image.digest | string | `""` |  |
| waitContainer.image.pullPolicy | string | `"IfNotPresent"` |  |
| waitContainer.image.pullSecrets | list | `[]` |  |
| waitContainer.image.registry | string | `"docker.io"` |  |
| waitContainer.image.repository | string | `"bitnami/os-shell"` |  |
| waitContainer.image.tag | string | `"12-debian-12-r34"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
