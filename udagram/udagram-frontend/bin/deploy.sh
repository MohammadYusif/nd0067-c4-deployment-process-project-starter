aws s3 sync ./www s3://udagram-frontend-368047729698/ --delete
aws s3 cp --cache-control="max-age=0, no-cache, no-store, must-revalidate" ./www/index.html s3://udagram-frontend-368047729698/
