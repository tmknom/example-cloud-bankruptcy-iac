CREATE EXTERNAL TABLE IF NOT EXISTS ${database_name}.${table_name} (
    eventVersion STRING,
    userIdentity STRUCT<
        type: STRING,
        principalId: STRING,
        arn: STRING,
        accountId: STRING,
        invokedBy: STRING,
        accessKeyId: STRING,
        userName: STRING,
        sessionContext: STRUCT<
            attributes: STRUCT<
                mfaAuthenticated: STRING,
                creationDate: STRING>,
            sessionIssuer: STRUCT<
                type: STRING,
                principalId: STRING,
                arn: STRING,
                accountId: STRING,
                userName: STRING>>>,
    eventTime STRING,
    eventSource STRING,
    eventName STRING,
    awsRegion STRING,
    sourceIpAddress STRING,
    userAgent STRING,
    errorCode STRING,
    errorMessage STRING,
    requestParameters STRING,
    responseElements STRING,
    additionalEventData STRING,
    requestId STRING,
    eventId STRING,
    resources ARRAY<STRUCT<
        arn: STRING,
        accountId: STRING,
        type: STRING>>,
    eventType STRING,
    apiVersion STRING,
    readOnly STRING,
    recipientAccountId STRING,
    serviceEventDetails STRING,
    sharedEventID STRING,
    vpcEndpointId STRING)
PARTITIONED BY (
    region string,
    date string)
ROW FORMAT SERDE
    'com.amazon.emr.hive.serde.CloudTrailSerde'
STORED AS INPUTFORMAT
    'com.amazon.emr.cloudtrail.CloudTrailInputFormat'
OUTPUTFORMAT
    'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
    's3://${bucket_name}/AWSLogs/${account_id}/CloudTrail/'
TBLPROPERTIES (
    'projection.enabled' = 'true',
    'projection.region.type' = 'enum',
    'projection.region.values' = '${regions}',
    'projection.date.type' = 'date',
    'projection.date.range' = 'NOW-3YEARS,NOW',
    'projection.date.format' = 'yyyy/MM/dd',
    'storage.location.template' = 's3://${bucket_name}/AWSLogs/${account_id}/CloudTrail/\$${region}/\$${date}');
