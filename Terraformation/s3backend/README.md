This data file is used to enable an S3 bucket to save the state files for all Terraform scripts. The state files will be saved in unique folder structure within the Terrafrom files.

The S3.tf also enables encryption AES256 and adds lifecycling to prevent a state file from being destroyed accidentally along with versioning.

Bucket = This should be a one-off name for the bucket and must be unique to S3. DevOps will use sgaspe-tfsate. If another team wants to use S3 back-end, they must change the name of the bucket.
