    bucket   = "roboshop1-remote-state"
    key = "catalogue-dev-deploy"
    region = "us-east-1"
    dynamodb_table = "roboshop-state-lock"


    #this is the DEV backend i.e., to store the state files in aws s3 lock with dynamodb