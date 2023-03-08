# Automation_Project

**Problem Statement - 1**

You have recently joined a new company named Dogecoin, which is growing very fast. As a DevOps engineer, you are required to perform  a set of tasks.  

**Task 1: Set Up Necessary Infrastructure**

Create an IAM role, a security group, an S3 bucket and launch an EC2 instance.

**Details of the task:**

Firstly, create an IAM role that can be attached to an EC2 instance, and attach a policy ‘AmazonS3FullAccess’. Use the role name as ‘YourFirstName_CourseAssignment’ and tag (key, value) as (EC2, S3Full).
Next, create a security group with the name ‘SG_YourFirstName’ and description as ‘Required for Course Assignment’ which opens inbound connections to ports 80, 443 and 22. Put the name tag as ‘WebServer Sec’ on the security group.
Now, set up an EC2 instance in the North Virginia (us-east-1) region:
Select AMI as ‘Ubuntu Server 18.04 LTS (HVM)’ and instance type as ‘t2.micro’.
This EC2 instance has to be created in default VPC.
Attach the IAM role which was created previously.
Create a tag with the key ‘Name’ and value ‘Web Server’ for the EC2 instance.
Attach the security group to the EC2 instance and launch it.
Finally, create an S3 bucket with the name ‘upgrad-<YourFName>’ or anything if not available.
  
**Problem Statement (Task 2)**
 
**Subtask Details**
  
You have been assigned to write an automation bash script named ‘automation.sh’ to perform the following subtasks.  

**Your Script Should:**
1. Perform an update of the package details and the package list at the start of the script. 
2. Install the apache2 package if it is not already installed.
3. Ensure that the apache2 service is running. 
4. Ensure that the apache2 service is enabled.
5. Create a tar archive of apache2 access logs and error logs that are present in the /var/log/apache2/ directory and place the tar into the /tmp/ directory. Create a tar of only the .log files and not any other file type that are already present in the /var/log/apache2/ directory. The name of tar archive should have following format:  <your _name>-httpd-logs-<timestamp>.tar.
6. The script should run the AWS CLI command and copy the archive to the s3 bucket 

Copying to the S3 bucket will require AWS Command Line Interface (CLI)  to be installed in the system.  

**Host Script On Github**
  
1. Initialise a Git repository with the name ‘Automation_Project’ and update the readme.md file which explains the project. This repository will now host your automation script 
2. Create a new ‘Dev’ branch and commit the script into it. 
3. Create a pull request from the ‘Dev’ to the master (called as ‘main’) branch in your GitHub repository. 
4. Finally, create a tag named ‘Automation-v0.1’ after you merge the ‘Dev’ branch to the main branch. You can use Github UI for the pull request and tagging ​​​

**Problem Statement (Task 3)**

**1. Bookkeeping**
 
Ensure that your script checks for the presence of the inventory.html file in /var/www/html/; if not found, creates it. This file will essentially serve as a web page to get the metadata of the archived logs.
  
At any point in time, the first line in the inventory.html file should be a header that will look like this: 

Log Type	Date Created	Type	Size

  ![image](https://user-images.githubusercontent.com/46825926/223649047-0a48e6f5-8b18-483f-a0bf-d3a6d006e114.png)


If an inventory file already exists, the content of the file should not be deleted or overwritten. New content should be only appended in a new line.
When your script runs, it should create a new entry in the inventory.html file about the following: 

- What log type is archived?
  
- Date when the logs were archived 

- The type of archive

- The size of the archive

Your inventory file should look like the following after multiple runs:

Log Type	Date Created	Type	Size
httpd-logs	010120201-100510	tar	10K
httpd-logs	020120201-100510	tar	40K
httpd-logs	030120201-100510	tar	4K
httpd-logs	040120201-100510	tar	6K

  ![image](https://user-images.githubusercontent.com/46825926/223648846-518af5d5-5f43-43d2-8505-89d7b20c306a.png)


**2. Cron Job**
  
Your script should create a cron job file in /etc/cron.d/ with the name 'automation' that runs the script /root/<git repository name>/automation.sh every day via the root user.
The script should be placed in the /root/<git repository name>/ directory. 
Your automation script is supposed to check if a cron job is scheduled or not; if not, then it should schedule a cron job by creating a cron file in the /etc/cron.d/ folder.

**Update Git Repository**
  
1. Commit this script into your 'Dev' branch and merge it into the master (or main)  branch of your GitHub repository.
2. Finally, create a tag ‘Automation-v0.2’ after merging your 'Dev' branch to the master branch via a pull request.
