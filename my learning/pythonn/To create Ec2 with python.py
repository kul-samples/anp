import boto3
import os

# Retrieve AWS credentials from environment variables
access_key = os.environ.get('AWS_ACCESS_KEY_ID')
secret_key = os.environ.get('AWS_SECRET_ACCESS_KEY')
region = 'ap-south-1'


def create_vpc(cidr_block):
    # Code to create VPC
    ec2_client = boto3.client('ec2', region_name=region)
    response = ec2_client.create_vpc(
        CidrBlock=cidr_block,
        AmazonProvidedIpv6CidrBlock=False
    )
    vpc_id = response['Vpc']['VpcId']

    # Enable DNS support and hostname
    ec2_client.modify_vpc_attribute(
        VpcId=vpc_id,
        EnableDnsSupport={'Value': True}
    )
    ec2_client.modify_vpc_attribute(
        VpcId=vpc_id,
        EnableDnsHostnames={'Value': True}
    )

    # Add name tag to VPC
    ec2_client.create_tags(
        Resources=[vpc_id],
        Tags=[
            {'Key': 'Name', 'Value': 'My_new_VPC'}
        ]
    )

    return vpc_id


def create_subnet(vpc_id, cidr_block, availability_zone):
    # Code to create subnet
    ec2_client = boto3.client('ec2', region_name=region)
    response = ec2_client.create_subnet(
        VpcId=vpc_id,
        CidrBlock=cidr_block,
        AvailabilityZone=availability_zone
    )
    subnet_id = response['Subnet']['SubnetId']

    # Add name tag to subnet
    ec2_client.create_tags(
        Resources=[subnet_id],
        Tags=[
            {'Key': 'Name', 'Value': 'My_new_Subnet'}
        ]
    )

    return subnet_id


def create_security_group(vpc_id, security_group_name, description):
    ec2_client = boto3.client('ec2', region_name=region)

    # Code to create security group
    response = ec2_client.create_security_group(
        GroupName=security_group_name,
        Description=description,
        VpcId=vpc_id
    )
    security_group_id = response['GroupId']

    # Add name tag to security group
    ec2_client.create_tags(
        Resources=[security_group_id],
        Tags=[
            {'Key': 'Name', 'Value': 'My_new_SecurityGroup'}
        ]
    )

    # Add inbound rules to security group
    ec2_client.authorize_security_group_ingress(
        GroupId=security_group_id,
        IpPermissions=[
            {
                'IpProtocol': 'tcp',
                'FromPort': 80,
                'ToPort': 80,
                'IpRanges': [{'CidrIp': '0.0.0.0/0'}]
            },
            {
                'IpProtocol': 'tcp',
                'FromPort': 22,
                'ToPort': 22,
                'IpRanges': [{'CidrIp': '0.0.0.0/0'}]
            }
        ]
    )

    # Check if the outbound rule already exists
    existing_outbound_rules = ec2_client.describe_security_groups(GroupIds=[security_group_id])[
        'SecurityGroups'][0]['IpPermissionsEgress']
    if not any(rule['IpProtocol'] == '-1' and len(rule['IpRanges']) == 1 and rule['IpRanges'][0]['CidrIp'] == '0.0.0.0/0'
               for rule in existing_outbound_rules):
        # Add outbound rule to security group
        ec2_client.authorize_security_group_egress(
            GroupId=security_group_id,
            IpPermissions=[
                {
                    'IpProtocol': '-1',
                    'IpRanges': [{'CidrIp': '0.0.0.0/0'}]
                }
            ]
        )

    return security_group_id


def create_internet_gateway(vpc_id):
    # Code to create internet gateway
    ec2_client = boto3.client('ec2', region_name=region)
    response = ec2_client.create_internet_gateway()
    internet_gateway_id = response['InternetGateway']['InternetGatewayId']

    # Attach internet gateway to VPC
    ec2_client.attach_internet_gateway(
        InternetGatewayId=internet_gateway_id,
        VpcId=vpc_id
    )

    # Add name tag to internet gateway
    ec2_client.create_tags(
        Resources=[internet_gateway_id],
        Tags=[
            {'Key': 'Name', 'Value': 'My_new_InternetGateway'}
        ]
    )

    return internet_gateway_id


def create_route_table(vpc_id, subnet_id, internet_gateway_id):
    # Create a route table
    ec2_client = boto3.client('ec2', region_name=region)
    response = ec2_client.create_route_table(VpcId=vpc_id)
    route_table_id = response['RouteTable']['RouteTableId']

    # Associate the route table with the subnet
    ec2_client.associate_route_table(
        RouteTableId=route_table_id,
        SubnetId=subnet_id
    )

    # Create a route to the internet gateway
    ec2_client.create_route(
        RouteTableId=route_table_id,
        DestinationCidrBlock='0.0.0.0/0',
        GatewayId=internet_gateway_id
    )

    # Add name tag to route table
    ec2_client.create_tags(
        Resources=[route_table_id],
        Tags=[
            {'Key': 'Name', 'Value': 'My_new_RouteTable'}
        ]
    )

    return route_table_id


def create_ec2_instance(subnet_id, security_group_id, image_id, instance_type, key_name):
    ec2_resource = boto3.resource('ec2', region_name=region)

    # Code to create EC2 instance
    instance = ec2_resource.create_instances(
        ImageId=image_id,
        InstanceType=instance_type,
        KeyName=key_name,
        MinCount=1,
        MaxCount=1,
        NetworkInterfaces=[{
            'SubnetId': subnet_id,
            'DeviceIndex': 0,
            'AssociatePublicIpAddress': True,
            'Groups': [security_group_id]
        }]
    )[0]

    # Add name tag to instance
    instance.create_tags(
        Tags=[
            {'Key': 'Name', 'Value': 'My_new_Instance'}
        ]
    )

    return instance.id


# Example usage
vpc_id = create_vpc('10.0.0.0/16')
subnet_id = create_subnet(vpc_id, '10.0.0.0/24', 'ap-south-1a')
security_group_id = create_security_group(vpc_id, 'my-security-group', 'My security group')
internet_gateway_id = create_internet_gateway(vpc_id)
route_table_id = create_route_table(vpc_id, subnet_id, internet_gateway_id)
instance_id = create_ec2_instance(subnet_id, security_group_id, 'ami-0f5ee92e2d63afc18', 't2.micro', 'test_kushil_pem')

print(f'VPC ID: {vpc_id}')
print(f'Subnet ID: {subnet_id}')
print(f'Security Group ID: {security_group_id}')
print(f'Internet Gateway ID: {internet_gateway_id}')
print(f'Route Table ID: {route_table_id}')
print(f'Instance ID: {instance_id}')
