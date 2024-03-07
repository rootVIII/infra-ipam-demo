
- Use `backend_setup/` to `terraform init` and `terraform apply` (TF State for the backend is managed locally)
- Above steps will create two separate AWS S3 buckets for TF State storage (development and production)
- Update the bucket name in the appropriate `backend.hcl` file: environments/&lt;env&gt;/backend.hcl

<pre>
<code># Navigate to environments/&lt;env&gt;
terraform init -backend-config=backend.hcl
terrafrom validate
terraform plan
terrafrom apply</code>
</pre>
