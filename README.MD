# GitHub Actions Deep Dive

About this lesson:

> You are working for a consumer software company that is preparing to announce a major new product.
> You have been tasked with setting up the landing page for users to learn more and sign up for the beta.
> Marketing has approved an initial static JavaScript page, but this page will need to be able to update quickly as news breaks.
> You will need to set up a GitHub Actions workflow to build and deploy the site to a non-Production bucket, and then promote it to a Production bucket once Marketing has approved the new design.

Objectives:

1. Configure an AWS Access Key
2. Set Up a Non-Production Workflow
   - Triggered by pushes to any branches matching `feature*`
   - Configure credentials
   - Install dependencies
   - Build code
   - Upload (to `preprod` bucket)
   - Deploy
3. Set Up a Production Workflow
   - Only triggered on approved `Merge Request`s to the `main` branch
   - Configure credentials
   - Install dependencies
   - Build code
   - Upload (to `prod` bucket)
   - Deploy

Note there are `terraform` scripts to help out.

## Feature - Initial Page

We create a branch: `feature-initial-page`