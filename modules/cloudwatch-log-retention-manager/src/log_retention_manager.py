import boto3
import os


def lambda_handler(event, context):
    default_region = os.environ.get('AWS_REGION', 'us-east-1')
    retain_days = int(os.environ.get('RETAIN_DAYS', '30'))

    session = boto3.Session()
    client = session.client('ec2', region_name=default_region)

    for region_dict in client.describe_regions()['Regions']:
        region = region_dict['RegionName']
        print('Region:', region)
        logs = session.client('logs', region_name=region)
        log_groups = logs.describe_log_groups()

        for log_group in log_groups['logGroups']:
            log_group_name = log_group['logGroupName']
            if 'retentionInDays' in log_group:
                print(region, log_group_name, log_group['retentionInDays'], 'days')
            else:
                print(region, log_group_name, retain_days, 'days **PUT**')
                response = logs.put_retention_policy(
                    logGroupName=log_group_name,
                    retentionInDays=retain_days
                )

    return 'CloudWatchLogRetention.Success'
