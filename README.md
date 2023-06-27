# Terraform AWS Solutions

This repository contains common solutions for AWS users implemented as standalone and reusable Terraform modules.

[![SWUbanner](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/banner2-direct.svg)](https://github.com/vshymanskyy/StandWithUkraine/blob/main/docs/README.md)

This repository is the part of [serverless.tf framework](https://github.com/antonbabenko/serverless.tf), which aims to simplify all operations when working with the serverless in Terraform.

## Solutions

### CloudWatch Log Retention Manager

**Problem:** Sometimes, AWS services like Lambda@Edge or misconfigured scripts create CloudWatch Log Groups with retention set to `Never`, but it is unlikely that you really want to keep logs forever and pay for them.

**Solution:** AWS Lambda function scheduled using EventBridge Scheduler that will set the retention period to 30 days. Everything is parametrized.

* [View module](https://github.com/terraform-aws-modules/terraform-aws-solutions/tree/master/modules/cloudwatch-log-retention-manager)
* [Example](https://github.com/terraform-aws-modules/terraform-aws-solutions/tree/master/examples/cloudwatch-log-retention-manager)
* [Related blog post](https://renaghan.com/posts/lambda-cloudwatch-log-retain-manager/) by [Padraic Renaghan](https://github.com/prenagha)


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


## Authors

Module managed by [Anton Babenko](https://github.com/antonbabenko). Check out [serverless.tf](https://serverless.tf) to learn more about doing serverless with Terraform.

Please reach out to [Betajob](https://www.betajob.com/) if you are looking for commercial support for your Terraform, AWS, or serverless project.

## License

Apache 2 Licensed. See [LICENSE](https://github.com/terraform-aws-modules/terraform-aws-solutions/tree/master/LICENSE) for full details.

## Additional information for users from Russia and Belarus

* Russia has [illegally annexed Crimea in 2014](https://en.wikipedia.org/wiki/Annexation_of_Crimea_by_the_Russian_Federation) and [brought the war in Donbas](https://en.wikipedia.org/wiki/War_in_Donbas) followed by [full-scale invasion of Ukraine in 2022](https://en.wikipedia.org/wiki/2022_Russian_invasion_of_Ukraine).
* Russia has brought sorrow and devastations to millions of Ukrainians, killed hundreds of innocent people, damaged thousands of buildings, and forced several million people to flee.
* [Putin khuylo!](https://en.wikipedia.org/wiki/Putin_khuylo!)
