S3_PREFIX=$(date +%F_%H-%M-%S)
echo "GitRob Runner starting at $S3_PREFIX"
./gitrob -exit-on-finish -mode 2 -no-expand-orgs -save ./gitrob-run-output.json $GITHUB_ACCOUNT_NAME
aws s3 cp ./gitrob-run-output.json s3://${OUTPUT_BUCKET_NAME}/${S3_PREFIX}_gitrob_${GITHUB_ACCOUNT_NAME}_output.json
aws s3 cp ./gitrob-run-output.json s3://${OUTPUT_BUCKET_NAME}/latest_gitrob_${GITHUB_ACCOUNT_NAME}_output.json
echo "GitRob Runner finished..."
