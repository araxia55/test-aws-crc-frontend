## AWS ☁️ Cloud Resume Challenge 🚀

![Ray's Portfolio Website](./frontend/public/assets/images/projects/aws_crc_architecture_diagram.png)

<p style="text-align: justify;">
The architecture diagram above illustrates the workflow of this website it starts off by 

1. Pushing a commit to the [aws-crc-frontend](https://github.com/araxia55/aws-crc-frontend) repo.
2. The commits are picked up by Github Actions and triggers the appropriate workflow pipeline to build and deploy the infrastructure once this is completed it then moves into triggering another pipeline to test then deploy the *website* - [raymund.cloud](https://www.raymund.cloud).

This is inspired by the [Cloud Resume Challenge](https://cloudresumechallenge.dev/docs/the-challenge/aws/).



#### Frontend section:

Ray's Frontend website *(HTML/CSS/JavaScript with Tailwind CSS)* delivers content thru Cloudfront and API Gateway. It's built with Infrastructure as Code *(Terraform)* with S3 as it's backend for keeping track of the state file. The AWS Services utilised to build this website are S3, Lambda, DynamoDB, API Gateway, Cloudfront, AWS Certificate Manager, Route53, and AWS Organizations. To wrap this up altogether with automation of building and deploying the infrastructure including the website a CI/CD *(Github Actions)* pipeline was tapped.

##### Aria Template

This is a personal blog, portfolio, or blog template created for [Astro](https://astro.build).

Astro port of [aria](https://github.com/static-templates/aria).

You can install this theme with the [Astro](https://astro.build) command like so:

```js
npm create astro@latest -- --template ccbikai/astro-aria
```

#### Mods for this template 

- Included a resume section that is printable or downloadable.
- Skills section in the resume page.
- Technology skill logos using [astro-iconify](https://www.npmjs.com/package/astro-icon).
- Labels/Markers to indicate a project or write-up are a work-in-progress.
- Typed animation using tailwind-css.
- Visitor counter tally at each bottom of a page.
</p>