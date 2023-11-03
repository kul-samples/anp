import boto3
import os

# Retrieve AWS credentials from environment variables
# access_key = os.environ.get('AWS_ACCESS_KEY_ID')
# print(access_key)
# secret_key = os.environ.get('AWS_SECRET_ACCESS_KEY')
region = 'ap-south-1'

# Create an EC2 client object
ec2_client = boto3.client(
    'ec2',
    # aws_access_key_id=access_key,
    # aws_secret_access_key=secret_key,
    region_name=region
)

# Create a VPC resource object
vpc_resource = ec2_client.create_vpc(
    CidrBlock='10.0.0.0/16'
)

# Get the VPC ID from the response
vpc_id = vpc_resource['Vpc']['VpcId']

# Add tags to the VPC
ec2_client.create_tags(
    Resources=[vpc_id],
    Tags=[{'Key': 'Name', 'Value': 'VPC'}]
)

# Create a subnet within the VPC
subnet_resource = ec2_client.create_subnet(
    VpcId=vpc_id,
    CidrBlock='10.0.0.0/24'
)

# Get the subnet ID from the response
subnet_id = subnet_resource['Subnet']['SubnetId']

# Add tags to the subnet
ec2_client.create_tags(
    Resources=[subnet_id],
    Tags=[{'Key': 'Name', 'Value': 'Subnet'}]
)

# Create an internet gateway
internet_gateway_resource = ec2_client.create_internet_gateway()

# Get the internet gateway ID from the response
internet_gateway_id = internet_gateway_resource['InternetGateway']['InternetGatewayId']

# Add tags to the internet gateway
ec2_client.create_tags(
    Resources=[internet_gateway_id],
    Tags=[{'Key': 'Name', 'Value': 'Internet_Gateway'}]
)

# Attach the internet gateway to the VPC
ec2_client.attach_internet_gateway(
    VpcId=vpc_id,
    InternetGatewayId=internet_gateway_id
)

# Create a route table for the VPC
route_table_resource = ec2_client.create_route_table(
    VpcId=vpc_id
)

# Get the route table ID from the response
route_table_id = route_table_resource['RouteTable']['RouteTableId']

# Add tags to the route table
ec2_client.create_tags(
    Resources=[route_table_id],
    Tags=[{'Key': 'Name', 'Value': 'Route_Table'}]
)

# Associate the route table with the subnet and internet gateway
ec2_client.associate_route_table(
    SubnetId=subnet_id,
    RouteTableId=route_table_id
)

ec2_client.create_route(
    RouteTableId=route_table_id,
    DestinationCidrBlock='0.0.0.0/0',
    GatewayId=internet_gateway_id)


# Create a security group within the VPC
security_group_resource = ec2_client.create_security_group(
    GroupName='MySecurityGroup',
    Description='My Security Group',
    VpcId=vpc_id
)

# Get the security group ID from the response
security_group_id = security_group_resource['GroupId']

# Add tags to the security group
ec2_client.create_tags(
    Resources=[security_group_id],
    Tags=[{'Key': 'Name', 'Value': 'Security_Group'}]
)

# Add an inbound rule to the security group
ec2_client.authorize_security_group_ingress(
    GroupId=security_group_id,
    IpPermissions=[
        {
            'IpProtocol': 'tcp',
            'FromPort': 22,
            'ToPort': 22,
            'IpRanges': [{'CidrIp': '0.0.0.0/0'}]
        }
    ]
)

# Create an EC2 resource object
ec2_resource = boto3.resource(
    'ec2',
    # aws_access_key_id=access_key,
    # aws_secret_access_key=secret_key,
    region_name=region
)

# Specify the parameters for creating an EC2 instance
instance_params = {
    'ImageId': 'ami-0f5ee92e2d63afc18',  # Replace with the desired AMI ID
    'InstanceType': 't2.micro',  # Replace with the desired instance type
    'KeyName': 'test_kushil_pem',  # Replace with your key pair name
    'MinCount': 1,
    'MaxCount': 1,
    'NetworkInterfaces': [
        {
            'SubnetId': subnet_id,
            'DeviceIndex': 0,
            'AssociatePublicIpAddress': True,
            'Groups': [security_group_id]
        }
    ]
}

# Create an EC2 instance in the specified subnet, security group, image, instance type, and key pair
instance = ec2_resource.create_instances(**instance_params)[0]

# Add tags to the instance
instance.create_tags(
    Tags=[{'Key': 'Name', 'Value': 'Instance'}]
)

# Print the instance ID
print(f'Instance ID: {instance.id}')
