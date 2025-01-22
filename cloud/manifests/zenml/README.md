# zenml

![Version: 0.71.0](https://img.shields.io/badge/Version-0.71.0-informational?style=flat-square)

Open source MLOps framework for portable production ready ML pipelines

**Homepage:** <https://zenml.io>

## Source Code

* <https://github.com/zenml-io/zenml>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| fullnameOverride | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| resources | object | `{}` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `1000` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `"zenml"` |  |
| tolerations | list | `[]` |  |
| zenml.analyticsOptIn | bool | `true` |  |
| zenml.auth.authCookieDomain | string | `nil` |  |
| zenml.auth.authCookieName | string | `nil` |  |
| zenml.auth.authType | string | `"OAUTH2_PASSWORD_BEARER"` |  |
| zenml.auth.corsAllowOrigins[0] | string | `"*"` |  |
| zenml.auth.deviceAuthPollingInterval | int | `5` |  |
| zenml.auth.deviceAuthTimeout | int | `300` |  |
| zenml.auth.deviceExpirationMinutes | string | `nil` |  |
| zenml.auth.externalCookieName | string | `nil` |  |
| zenml.auth.externalLoginURL | string | `nil` |  |
| zenml.auth.externalServerID | string | `nil` |  |
| zenml.auth.externalUserInfoURL | string | `nil` |  |
| zenml.auth.jwtSecretKey | string | `nil` |  |
| zenml.auth.jwtTokenAlgorithm | string | `"HS256"` |  |
| zenml.auth.jwtTokenAudience | string | `nil` |  |
| zenml.auth.jwtTokenExpireMinutes | string | `nil` |  |
| zenml.auth.jwtTokenIssuer | string | `nil` |  |
| zenml.auth.jwtTokenLeewaySeconds | int | `10` |  |
| zenml.auth.maxFailedDeviceAuthAttempts | int | `3` |  |
| zenml.auth.rbacImplementationSource | string | `nil` |  |
| zenml.auth.trustedDeviceExpirationMinutes | string | `nil` |  |
| zenml.backupSecretsStore.aws.authConfig.aws_access_key_id | string | `nil` |  |
| zenml.backupSecretsStore.aws.authConfig.aws_secret_access_key | string | `nil` |  |
| zenml.backupSecretsStore.aws.authConfig.region | string | `nil` |  |
| zenml.backupSecretsStore.aws.authConfig.role_arn | string | `nil` |  |
| zenml.backupSecretsStore.aws.authMethod | string | `"secret-key"` |  |
| zenml.backupSecretsStore.azure.authConfig.client_id | string | `nil` |  |
| zenml.backupSecretsStore.azure.authConfig.client_secret | string | `nil` |  |
| zenml.backupSecretsStore.azure.authConfig.tenant_id | string | `nil` |  |
| zenml.backupSecretsStore.azure.authMethod | string | `"service-principal"` |  |
| zenml.backupSecretsStore.azure.key_vault_name | string | `nil` |  |
| zenml.backupSecretsStore.custom.class_path | string | `"my.custom.secrets.store.MyCustomSecretsStore"` |  |
| zenml.backupSecretsStore.enabled | bool | `false` |  |
| zenml.backupSecretsStore.gcp.authConfig.external_account_json | string | `nil` |  |
| zenml.backupSecretsStore.gcp.authConfig.project_id | string | `nil` |  |
| zenml.backupSecretsStore.gcp.authConfig.service_account_json | string | `nil` |  |
| zenml.backupSecretsStore.gcp.authConfig.target_principal | string | `nil` |  |
| zenml.backupSecretsStore.gcp.authConfig.user_account_json | string | `nil` |  |
| zenml.backupSecretsStore.gcp.authMethod | string | `"service-account"` |  |
| zenml.backupSecretsStore.hashicorp.max_versions | string | `nil` |  |
| zenml.backupSecretsStore.hashicorp.vault_addr | string | `"https://vault.example.com"` |  |
| zenml.backupSecretsStore.hashicorp.vault_namespace | string | `nil` |  |
| zenml.backupSecretsStore.hashicorp.vault_token | string | `nil` |  |
| zenml.backupSecretsStore.sql.encryptionKey | string | `nil` |  |
| zenml.backupSecretsStore.type | string | `"sql"` |  |
| zenml.dashboardURL | string | `nil` |  |
| zenml.database.backupStrategy | string | `"in-memory"` |  |
| zenml.debug | bool | `true` |  |
| zenml.defaultProject | string | `"default"` |  |
| zenml.deploymentType | string | `nil` |  |
| zenml.enableImplicitAuthMethods | bool | `false` |  |
| zenml.environment | object | `{}` |  |
| zenml.image.pullPolicy | string | `"Always"` |  |
| zenml.image.repository | string | `"zenmldocker/zenml-server"` |  |
| zenml.image.tag | string | `nil` |  |
| zenml.ingress.annotations | string | `nil` |  |
| zenml.ingress.className | string | `"nginx"` |  |
| zenml.ingress.enabled | bool | `true` |  |
| zenml.ingress.host | string | `nil` |  |
| zenml.ingress.path | string | `"/"` |  |
| zenml.ingress.tls.enabled | bool | `false` |  |
| zenml.ingress.tls.generateCerts | bool | `false` |  |
| zenml.ingress.tls.secretName | string | `"zenml-tls-certs"` |  |
| zenml.replicaCount | int | `1` |  |
| zenml.rootUrlPath | string | `nil` |  |
| zenml.secretEnvironment | object | `{}` |  |
| zenml.secretsStore.aws.authConfig.aws_access_key_id | string | `nil` |  |
| zenml.secretsStore.aws.authConfig.aws_secret_access_key | string | `nil` |  |
| zenml.secretsStore.aws.authConfig.region | string | `nil` |  |
| zenml.secretsStore.aws.authConfig.role_arn | string | `nil` |  |
| zenml.secretsStore.aws.authMethod | string | `"secret-key"` |  |
| zenml.secretsStore.aws.aws_access_key_id | string | `nil` |  |
| zenml.secretsStore.aws.aws_secret_access_key | string | `nil` |  |
| zenml.secretsStore.aws.aws_session_token | string | `nil` |  |
| zenml.secretsStore.aws.region_name | string | `nil` |  |
| zenml.secretsStore.azure.authConfig.client_id | string | `nil` |  |
| zenml.secretsStore.azure.authConfig.client_secret | string | `nil` |  |
| zenml.secretsStore.azure.authConfig.tenant_id | string | `nil` |  |
| zenml.secretsStore.azure.authMethod | string | `"service-principal"` |  |
| zenml.secretsStore.azure.azure_client_id | string | `nil` |  |
| zenml.secretsStore.azure.azure_client_secret | string | `nil` |  |
| zenml.secretsStore.azure.azure_tenant_id | string | `nil` |  |
| zenml.secretsStore.azure.key_vault_name | string | `nil` |  |
| zenml.secretsStore.custom.class_path | string | `"my.custom.secrets.store.MyCustomSecretsStore"` |  |
| zenml.secretsStore.enabled | bool | `true` |  |
| zenml.secretsStore.gcp.authConfig.project_id | string | `nil` |  |
| zenml.secretsStore.gcp.authConfig.service_account_json | string | `nil` |  |
| zenml.secretsStore.gcp.authConfig.target_principal | string | `nil` |  |
| zenml.secretsStore.gcp.authConfig.user_account_json | string | `nil` |  |
| zenml.secretsStore.gcp.authMethod | string | `"service-account"` |  |
| zenml.secretsStore.gcp.google_application_credentials | string | `nil` |  |
| zenml.secretsStore.gcp.project_id | string | `nil` |  |
| zenml.secretsStore.hashicorp.max_versions | string | `nil` |  |
| zenml.secretsStore.hashicorp.vault_addr | string | `"https://vault.example.com"` |  |
| zenml.secretsStore.hashicorp.vault_namespace | string | `nil` |  |
| zenml.secretsStore.hashicorp.vault_token | string | `nil` |  |
| zenml.secretsStore.sql.encryptionKey | string | `nil` |  |
| zenml.secretsStore.type | string | `"sql"` |  |
| zenml.secure_headers.cache | string | `"enabled"` |  |
| zenml.secure_headers.content | string | `"enabled"` |  |
| zenml.secure_headers.csp | string | `"enabled"` |  |
| zenml.secure_headers.hsts | string | `"enabled"` |  |
| zenml.secure_headers.permissions | string | `"enabled"` |  |
| zenml.secure_headers.referrer | string | `"enabled"` |  |
| zenml.secure_headers.server | string | `"enabled"` |  |
| zenml.secure_headers.xfo | string | `"enabled"` |  |
| zenml.secure_headers.xxp | string | `"enabled"` |  |
| zenml.serverURL | string | `nil` |  |
| zenml.service.port | int | `80` |  |
| zenml.service.type | string | `"ClusterIP"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
