## AWS ☁️ Cloud Resume Challenge 🚀 ##

This is a test site for [raymund.cloud](https://www.raymund.cloud)

![Ray's Portfolio Website](./frontend/public/assets/images/projects/aws_crc_architecture_diagram.png)

<p style="text-align: justify;">
The architecture diagram above illustrates the workflow of this website it starts off by 

1. Pushing a commit to the [test-aws-crc-frontend](https://github.com/araxia55/test-aws-crc-frontend) repo.
2. The commits are picked up by Github Actions and triggers the appropriate workflow pipeline to build and deploy the infrastructure once this is completed it then moves into triggering another pipeline to test then deploy the *website* - [raymund.site](https://www.raymund.site).

This is inspired by the [Cloud Resume Challenge](https://cloudresumechallenge.dev/docs/the-challenge/aws/).

## Getting started ##
The `prerequisites` section will configure s3 as your backend.
1. Clone this repo.
2. Traverse to `aws-crc-frontend/infra/prerequisites`
3. Run these Terraform commands. 
```bash
   terraform init
   terraform apply
```

Now, go to `aws-crc-frontend/infra`
The `infra` section will create the infrastructure for the website.
1. Setup `aws configure` with your keys.
2. Run these Terraform commands. 
```bash
   terraform init
   terraform apply
```

Also, in the deployment pipeline under `.github\workflows` modify the variables below to suit the secrets configured in Github.
In `deploy-frontend.yml`
- `secrets.BUCKET_ID`
- `secrets.DISTRIBUTION_ID`
- `secrets.AWS_ACCESS_KEY_ID`
- `secrets.AWS_SECRET_ACCESS_KEY`

and `deploy-infra.yml`
- `secrets.TF_ACCESS_KEY_ID`
- `secrets.TF_SECRET_ACCESS_KEY`