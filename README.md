
# 📦 Istio Bookinfo Microservices Deployment Lab

In this lab, the **Istio Bookinfo microservices** will be deployed to a **local Kubernetes cluster** (running in Vagrant) using **HCP Terraform**, with **one Terraform Cloud workspace per microservice**.

---

## ✅ Requirements

- 🧩 Kubernetes cluster running locally (e.g., via Vagrant)
- 🌩️ HCP Terraform (Terraform Cloud) account

---

## 🔐 Step 1: Authenticate Your Computer to HCP Terraform

To enable your Terraform CLI to interact with Terraform Cloud, you'll first need to generate and configure an **API token**.

### 🔑 Create an API Token

1. Visit [HCP Terraform](https://app.terraform.io/)
2. Click on your **user avatar** in the top right corner.
3. Select **User Settings**.
4. Go to the **Tokens** section.
5. Click **Create an API Token** and copy it.

![Create API Token](https://github.com/user-attachments/assets/d057c73b-f14d-4a9e-b526-fdab33e43d24)

### 🔌 Authenticate via CLI

Use the Terraform CLI to authenticate:

```bash
terraform login
```

- Type `yes` when prompted.
- Paste the copied token into the browser window that opens.

---

## 🧱 Step 2: Create Organization and Project in HCP Terraform

Once authenticated, you’ll organize your workspaces under a specific **Organization** and **Project**.

### 🏢 Create an Organization

1. Log in to [HCP Terraform](https://app.terraform.io/)
2. Click **New Organization** on the dashboard.
3. Name your organization:  
   ```text
   hc-cnfp2
   ```


### 📁 Create a Project

1. Inside the `hc-cnfp2` organization, go to the **Projects** tab.
2. Click **New Project**.
3. Name your project:  
   ```text
   bookinfo
   ```


5. Click **Create Project**.

---

## 📥 Step 3: Clone This Repository

Clone the lab repository to your local environment:

```bash
git clone git@github.com:TunNyein/bookinfo-terraforming.git
cd bookinfo-terraforming
```

---

## 🚀 Step 4: Initialize and Apply Terraform Workspaces

### 1️⃣ Deploy the `namespace` first

```bash
cd namespace
terraform init
```

- After initializing, go to the **namespace** workspace in HCP Terraform.
- Change the execution mode from **remote** to **local**.

Then run:

```bash
terraform apply
```

### 2️⃣ Deploy other microservices

For each microservice (e.g., `ratings`, `reviews`, `productpages`, `details`):

```bash
cd ../<microservice-folder>
terraform init
```

- In HCP Terraform, switch the workspace execution mode to **local** if needed.
- Then run:

```bash
terraform apply
```

Repeat the steps for each microservice directory.

---

## 🧪 Example Directory Structure

```
bookinfo-terraforming/
├── namespace/
├── ratings/
├── reviews/
├── details/
└── productpages/
```
## 🔍 Verify Deployment in Kubernetes
To verify that resources have been deployed:

```
kubectl get ns
kubectl get all -n bookinfo

```
## 📘 Reference
This lab is inspired by the Istio Bookinfo application and customized for learning Terraform with Kubernetes and HCP Terraform.

```
Let me know if you want me to help with anything else!

```
Thank You
