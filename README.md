## FarGitRob - Simple Docker/AWS ECS Fargate demo

The awesome GitLab Red Team seem to have a fork of GitRob that works with GitHub and GitLab. They kindly include build/run with Docker.

I wanted to run GitRob within AWS and store the results in S3. While it is possible AWS Lambda would work, I decided to do this with ECS/Fargate.
I suspected the repo analysis would run for longer than 15 minutes and running this on an org took 17 minutes!

This demo uses the GitLab version of GitRob: https://gitlab.com/gitlab-com/gl-security/security-operations/gl-redteam/gitrob

That is pushed as a "golden image" to my DockerHub account: https://hub.docker.com/repository/docker/seaninety/gitrob

If you want to follow along you can either trust I didn't put some malware in there (I didn't and far as I know nor did upstream :-)) or make your own golden image and use that.

This also requires 3 SSM parameters (why not Secrets Manager? Parameters are free and secrets are expensive - sounds like a t-shirt slogan!):

- **/gitrob/s3_bucket_name** -> The name of the bucket to store the output
- **/gitrob/github_access_token** -> Your github access token
- **/gitrob/github_account_name** -> Your github account name

These are not CFd as the access token is a SecureString and you can't CF those.
