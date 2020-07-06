#!/usr/bin/env bash

BucketList=($(aws s3api list-buckets | jq .Buckets[].Name -r))

for BucketName in "${BucketList[@]}"; do
  echo $BucketName
  # Set Versionint
  aws s3api put-bucket-versioning --bucket $BucketName --versioning-configuration Status=Enabled # Enabled | Suspended, Default is empty. (In this case work as "Suspended")
  # Get Versioning
  aws s3api get-bucket-versioning --bucket $BucketName
done
