# S3 + CloudFront

S3に配置した静的WebページをCloudFrontで配信する。
日本からのアクセスのみ許可。

```
terraform init
terraform plan -var="bucket_name=your-bucket-name"
terraform apply -var="bucket_name=your_bucket-name"
```
