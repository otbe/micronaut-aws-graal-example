#!/bin/sh
docker build . -t foo
mkdir -p build
docker run --rm --entrypoint cat foo  /home/application/function.zip > build/function.zip

# check for role
ROLE_NAME=lambda-basic-role
ROLE_ARN=`aws iam get-role --role-name ${ROLE_NAME} | grep Arn | cut -d'"' -f4`
if [ "${ROLE_ARN}" == "" ]; then
    echo "No role ${ROLE_NAME} exists!"
    echo "Create one using: "
    echo "> aws iam create-role --role-name ${ROLE_NAME} --assume-role-policy-document file://lambda-role-policy.json"
    echo "> aws iam attach-role-policy --role-name ${ROLE_NAME} --policy-arn arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
    exit 1
fi

aws lambda create-function --function-name foo \
--zip-file fileb://build/function.zip --handler function.handler --runtime provided \
--role ${ROLE_ARN}
