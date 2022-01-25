provider "aws" {
  region  = var.region
}

resource "aws_iam_role_policy" "power_users_policy" {
  name = "power_users_policy"
  role = aws_iam_role.power_users.id

  policy = jsonencode(
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "ec2:DescribeFastLaunchImages",
                "ec2:GetIpamResourceCidrs",
                "ec2:GetIpamPoolCidrs",
                "ec2:GetEbsEncryptionByDefault",
                "codebuild:BatchGetBuilds",
                "ec2:DescribeScheduledInstanceAvailability",
                "resource-groups:GetGroupConfiguration",
                "ec2:GetEbsDefaultKmsKeyId",
                "ebs:GetSnapshotBlock",
                "cloudwatch:DescribeInsightRules",
                "codebuild:BatchGetReports",
                "s3:GetBucketWebsite",
                "s3:GetMultiRegionAccessPoint",
                "ec2:DescribeFastSnapshotRestores",
                "s3:GetObjectLegalHold",
                "s3:GetBucketNotification",
                "cloudwatch:GetMetricStatistics",
                "s3:DescribeMultiRegionAccessPointOperation",
                "s3:GetReplicationConfiguration",
                "codebuild:GetReportGroupTrend",
                "ec2:GetPasswordData",
                "ec2:GetAssociatedIpv6PoolCidrs",
                "ec2:DescribeScheduledInstances",
                "ec2:GetSpotPlacementScores",
                "cloudwatch:DescribeAlarms",
                "cloudwatch:GetMetricStream",
                "s3:GetStorageLensDashboard",
                "s3:GetLifecycleConfiguration",
                "s3:GetInventoryConfiguration",
                "s3:GetBucketTagging",
                "codebuild:GetResourcePolicy",
                "s3:GetAccessPointPolicyForObjectLambda",
                "ec2:GetNetworkInsightsAccessScopeAnalysisFindings",
                "resource-groups:GetTags",
                "codebuild:DescribeCodeCoverages",
                "ec2:ExportClientVpnClientCertificateRevocationList",
                "cloudwatch:DescribeAlarmHistory",
                "codebuild:BatchGetReportGroups",
                "cloudwatch:GetMetricWidgetImage",
                "ec2:GetIpamPoolAllocations",
                "s3:GetMultiRegionAccessPointPolicyStatus",
                "s3:GetBucketVersioning",
                "s3:GetAccessPointConfigurationForObjectLambda",
                "ec2:GetIpamAddressHistory",
                "s3:GetStorageLensConfiguration",
                "s3:GetAccountPublicAccessBlock",
                "autoscaling-plans:DescribeScalingPlans",
                "s3:GetBucketCORS",
                "ec2:GetManagedPrefixListAssociations",
                "autoscaling-plans:DescribeScalingPlanResources",
                "s3:GetObjectVersion",
                "codebuild:DescribeTestCases",
                "s3:GetObjectVersionTagging",
                "ec2:ExportClientVpnClientConfiguration",
                "ec2:DescribeVolumesModifications",
                "ec2:GetHostReservationPurchasePreview",
                "s3:GetStorageLensConfigurationTagging",
                "ec2:GetConsoleScreenshot",
                "s3:GetObjectAcl",
                "s3:GetBucketObjectLockConfiguration",
                "s3:GetIntelligentTieringConfiguration",
                "ec2:GetLaunchTemplateData",
                "resource-groups:GetGroup",
                "ec2:GetSerialConsoleAccessStatus",
                "cloudwatch:DescribeAlarmsForMetric",
                "s3:GetObjectVersionAcl",
                "s3:GetBucketPolicyStatus",
                "s3:GetObjectRetention",
                "cloudwatch:GetDashboard",
                "ec2:GetManagedPrefixListEntries",
                "s3:GetJobTagging",
                "cloudwatch:GetInsightRuleReport",
                "ec2:DescribeVpnConnections",
                "ec2:GetNetworkInsightsAccessScopeContent",
                "ec2:GetReservedInstancesExchangeQuote",
                "s3:GetObject",
                "ec2:GetInstanceTypesFromInstanceRequirements",
                "s3:DescribeJob",
                "s3:GetAnalyticsConfiguration",
                "s3:GetObjectVersionForReplication",
                "ec2:DescribeElasticGpus",
                "s3:GetAccessPointForObjectLambda",
                "resource-groups:GetGroupQuery",
                "codebuild:BatchGetBuildBatches",
                "s3:GetAccessPoint",
                "ec2:GetDefaultCreditSpecification",
                "cloudwatch:GetMetricData",
                "s3:GetBucketLogging",
                "ec2:GetCapacityReservationUsage",
                "s3:GetAccelerateConfiguration",
                "ec2:GetSubnetCidrReservations",
                "s3:GetBucketPolicy",
                "ebs:ListChangedBlocks",
                "cloudwatch:DescribeAnomalyDetectors",
                "ec2:GetConsoleOutput",
                "s3:GetEncryptionConfiguration",
                "s3:GetObjectVersionTorrent",
                "s3:GetBucketRequestPayment",
                "ec2:GetFlowLogsIntegrationTemplate",
                "s3:GetAccessPointPolicyStatus",
                "s3:GetObjectTagging",
                "s3:GetMetricsConfiguration",
                "s3:GetBucketOwnershipControls",
                "s3:GetBucketPublicAccessBlock",
                "codebuild:BatchGetProjects",
                "s3:GetMultiRegionAccessPointPolicy",
                "s3:GetAccessPointPolicyStatusForObjectLambda",
                "ec2:DescribeTags",
                "ec2:GetCoipPoolUsage",
                "ebs:ListSnapshotBlocks",
                "s3:GetBucketAcl",
                "ec2:GetAssociatedEnclaveCertificateIamRoles",
                "s3:GetObjectTorrent",
                "autoscaling-plans:GetScalingPlanResourceForecastData",
                "s3:GetBucketLocation",
                "s3:GetAccessPointPolicy"
            ],
            "Resource": "*"
        }
    ]
}
)
}

resource "aws_iam_role" "power_users" {
  name = "power_users"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}