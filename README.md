# RHEL + latest EPEL

Install packer



```
PROJECT=your-project
packer build -var 'project_id=$PROJECT' rhel.pkr.hcl
```