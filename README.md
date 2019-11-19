# NextGenConf Infrastructure

This repo contains the declaration of the infrastructure resources required
to operate the NextGen Conf web app.

The resources are declared and deployed with [Terraform](https://www.terraform.io/).

## Required variables

In order to create and apply Terraform plans, the terraform tool needs
to be authorized to access the [backend](https://www.terraform.io/docs/backends/index.html).
Next Gen Conf uses the [azurerm](https://www.terraform.io/docs/backends/types/azurerm.html)
backend to store it's state and authenticates using a _Service Principal_.
The backend state is found [here](https://ms.portal.azure.com/#blade/Microsoft_Azure_Storage/ContainerMenuBlade/overview/storageAccountId/%2Fsubscriptions%2Fb087ec80-bbdd-4b0a-9fb3-ca2eb729208c%2FresourceGroups%2Fterraform%2Fproviders%2FMicrosoft.Storage%2FstorageAccounts%2Fngcterraform/path/ngc-tfstate/).
Authenticating to the azurerm backend as a Service Principal requires several variables:

- `client_id`: The Client ID of the Service Principal.
  This is sourced by Terraform from the `ARM_CLIENT_ID` environment variable.
  The Azure App Registration (which acts as the Service Principal) can be found
  [here](https://ms.portal.azure.com/#blade/Microsoft_AAD_RegisteredApps/ApplicationMenuBlade/Overview/appId/28f77aaa-53e7-47bc-ad78-d8d7b2b98009/isMSAApp/).
- `client_secret`: The Client Secret of the Service Principal.
  This is sourced by Terraform from the `ARM_CLIENT_SECRET` environment variable.
  This value of this environment variable is sourced from a Github Secret.
  This value is taken from [this Azure Key Vault Secret](https://ms.portal.azure.com/#@microsoft.onmicrosoft.com/asset/Microsoft_Azure_KeyVault/Secret/https://terraform-agility.vault.azure.net/secrets/ngc-terraform-client-secret)
- `subscription_id`: The Azure Subscription ID in which the azurerm backend Storage account exists.
  This is sourced by Terraform from the `ARM_SUBSCRIPTION_ID` environment variable.
- `tenant_id`:  The Azure Tenant ID in which the subscription exists.
  This is sourced by Terraform from the `ARM_TENANT_ID` environment variable.
