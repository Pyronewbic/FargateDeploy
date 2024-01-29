# Automated ECS deployments

[![workflow](https://github.com/tbobm/tf-ecr-ecs-gh-deploy/actions/workflows/workflow.yml/badge.svg)](https://github.com/tbobm/tf-ecr-ecs-gh-deploy/actions/workflows/workflow.yml)

Create the AWS infrastructure (ECS, ECR, ALB, ...) to deploy a container and
automatically update it using Github Action.

## Core components

### AWS

The AWS infrastructure is setup using terraform in the [`./terraform`](./terraform).

The following components are deployed:

- Application Load Balancer ([`./lb.tf`](./terraform/lb.tf))
- ECS Cluster / ECS Service ([`./ecs.tf`](./terraform/ecs.tf))
- Elastic Container Registry ([`./ecr.tf`](./terraform/ecr.tf))
- IAM permissions ([`./iam.tf`](./terraform/iam.tf))
- VPC configuration ([`./vpc.tf`](./terraform/vpc.tf))

### CI/CD

The repository leverages the [AWS Github Actions](https://github.com/aws-actions/)
maintained by AWS.

The main goal is to provide an example configuration of the following workflow:

- Run the integration tests
- Build the Docker image
- Publish it to a private ECR
- Update the corresponding ECS Service (by editing the task image)

[ci-success]: https://github.com/tbobm/tf-ecr-ecs-gh-deploy/actions/runs/704500533
