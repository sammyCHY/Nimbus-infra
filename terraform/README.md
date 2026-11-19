# Terraform Project
Below are the step process of executing terraform project.

First, You have create a folder named "Nimbus-infra" in your local computer eg Desktop, download, documents etc.
Then, run `mkdir terraform` to create a terraform directory and `cd` into it.
Create main.tf and provider.tf using `touch` command
![The Image here shows the creation main.tf and provider.tf](image/main-provider.png)

The Next is to install azure cli so that local computer can access the azure cloud for any implementation.

I ran azure login and az login but the two command failed the I checked by using az --version but returned error.

![The Image shows the az logon error](image/azre-login-error.png)

I have to open my powershell and run the command below:

`winget install -e --id Microsoft.AzureCLI`

![The Image shows the azure cli installation](image/azurecli-installation.png)

![The Image shows the azure cli installation](image/azuercli-installation1.png)

After the installation, I have to proceed with the command on the image.

![The Image shows the cli login](image/cli-login.png)

At this point, I started hitting errors trying to login.

![The Image here showing login errors](image/az-login-error.png)

After, repeated trying and code authentication, I later logged in and version confirmed.

![The Image here show az version and login](image/az-access.png)

After accessing the az cli, then I have to `cd` into the terraform directory where I have the resources configured.

![Here shows terraform init](image/terraform-init.png)

From this point, I started heating errors back to back.
The error keeps indicating the path, However, I have already installed the the az cli in my local pc, at this point I have to add installation to the "system environmental variable path" the system was restarted
Then I have to login using the command : az login ---tenant ............................  at this point, it started working, input any number to proceed (1)
The Image below shows all the steps.

![The Image here shows all the steps to login to az](image/login-subscription.png)


The error persist, but the troubleshooting continues.

![The Image shows the error solving](image/login-subscription1.png)

However, the error resolved but now is terraform plan error which has to do with the location argument.

![The Image shows the terraform error](image/terraform-plan-error.png)

![The Image shows the terraform error](image/terraform-plan.png)

I have to logout and login again then try `terraform plan` and `terraform apply`

At this stage the applying was successful, below is the image.

![The Image shows the terraform and apply and the running in the cloud](image/terraform-apply.png)

![The Image shows the terraform and apply and the running in the cloud](image/terraform-apply1.png)

After deploying using terraform then use the command:`terraform destroy` to pull the resources down.

![The Image here shows terraform destroy](image/terraform-destroy.png)


At this point, I have finished all my configuration including the "variable.tf and output.tf". It's now time to login and start implementing the project.

![The Image shows that I'm trying to login into the azure platform](image/az-login.png)

Below are some the errors encountered during `terraform-validate`  some of the errors are the argument but the one ones below is very important.

![The Image shows the error encountered during the deployment of terraform validate](image/errors-in-full.png)

I had an error in storage line 7 which is: `allow_blob_public_access = false` to
`allow_nested_items_to_be_public = false`.

another error is from the `azurerm_storage_container` at this point I have to remove resource group name, It suppose to be at `storage_account_name`.Everything in the image.

terraform plan output, [All errors rectified].

![image show terrafor plan](image/terraform-plan1.png)

![image show terrafor plan](image/terraform-plan11.png)

After the plan, the next was to apply.

![The image shows terraform apply ](image/terraform-apply-final.png)

![The image shows terraform apply ](image/terraform-apply-final1.png)

![The image shows terraform apply ](image/terraform-apply-final2.png)

![The image shows terraform apply ](image/terraform-apply-final3.png)

![The image shows terraform apply ](image/terraform-apply-final4.png)

![The image shows terraform apply ](image/terraform-apply-final5.png)

![The image shows terraform apply ](image/terraform-apply-final6.png)

Ater the apply, I got two error, the first, I have to register certain core infrastructure service (like Kubernetes/Container Service) before my subscription is allowed to create them. here is the command I run to create them: `az provider register --namespace Microsoft.ContainerService`

After this, the error cleared but remaining the `Key Vault timeout error`

I keep getting the error on `azurerm_key_vault.kv` back to back, the reason is that Terraform tries to immediately read back attributes like certificate contacts or policy lists right after creation, and Azure's backend control plane for Key Vaults takes a little longer to stabilize.

![The Image here shows the error from the keyvault during terraform apply](image/keyvault-error.png)

These are the things I needed to do temporaly, I have to comment keyvault.tf file block and Rbac.tf role assignment in keyvault including the `output keyvault resources`. Thereafter, I have to run terraform init -upgrade and `terraform apply`. 

However, after the process above, I still get some errors again.

![The Image shows keyvalt error again](image/keyvault-error1.png)

At this point I felt, I have resolved the issues.

![The Image shows the error resolved on the terraform keyvault ](image/error-resolved1.png)

![The Image shows the error resolved on the terraform keyvault ](image/error-resolved2.png)

Then, I proceeded with `terraform apply`

![The Image here shows terraform apply](image/terraform-apply-success.png)

![The Image here shows terraform apply](image/terraform-apply-success1.png)

![The Image here shows terraform apply](image/terraform-apply-success2.png)

![The Image here shows terraform apply](image/terraform-apply-success3.png)

The whole infrastructure is now at the azure platform.

![The Image shows the infrastructure deployed on the server](image/terraform-azure-final.png)

![The Image shows the infrastructure deployed on the server](image/terraform-azure-final1.png)

![The Image shows the infrastructure deployed on the server](image/terraform-azure-final2.png)

![The Image shows the infrastructure deployed on the server](image/terraform-azure-final3.png)