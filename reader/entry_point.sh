S3_PREFIX=$(date +%F_%H-%M-%S)
echo "GitRob Runner starting at $S3_PREFIX"
aws s3 cp s3://${OUTPUT_BUCKET_NAME}/latest_gitrob_${GITHUB_ACCOUNT_NAME}_output.json ./gitrob-output.json 
./gitrob -load ./gitrob-output.json
echo "GitRob Runner finished..."
