#!powershell

# Copyright: (c) 2018, Ansible Project
# Copyright: (c) 2018, Simon Baerlocher <s.baerlocher@sbaerlocher.ch>
# Copyright: (c) 2018, ITIGO AG <opensource@itigo.ch>
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

#Requires -Module Ansible.ModuleUtils.ArgvParser
#Requires -Module Ansible.ModuleUtils.CommandUtil
#Requires -Module Ansible.ModuleUtils.Legacy

$ErrorActionPreference = "Stop"
Set-StrictMode -Version 2.0
$wsus = Get-WSUSServer
$wsusConfig = $wsus.GetConfiguration()
$wsusSubscription = $wsus.GetSubscription()

# Create a new result object
$result = @{
    changed       = $false
    ansible_facts = @{
        ansible_wsus = @{
            wsus         = @{
                WebServiceUrl                    = $wsus.WebServiceUrl
                BypassApiRemoting                = $wsus.BypassApiRemoting
                IsServerLocal                    = $wsus.IsServerLocal
                Name                             = $wsus.Name
                Version                          = $wsus.Version
                IsConnectionSecureForApiRemoting = $wsus.IsConnectionSecureForApiRemoting
                PortNumber                       = $wsus.PortNumber
                PreferredCulture                 = $wsus.PreferredCulture
                ServerName                       = $wsus.ServerName
                UseSecureConnection              = $wsus.UseSecureConnection
                ServerProtocolVersion            = $wsus.ServerProtocolVersion
            }
            config       = @{
                UpdateServer                                  = $WsusConfig.UpdateServer
                LastConfigChange                              = $WsusConfig.LastConfigChange
                ServerId                                      = $WsusConfig.ServerId
                SupportedUpdateLanguages                      = $WsusConfig.SupportedUpdateLanguages
                TargetingMode                                 = $WsusConfig.TargetingMode
                TrackDynamicCategories                        = $WsusConfig.TrackDynamicCategories
                SyncFromMicrosoftUpdate                       = $WsusConfig.SyncFromMicrosoftUpdate
                IsReplicaServer                               = $WsusConfig.IsReplicaServer
                HostBinariesOnMicrosoftUpdate                 = $WsusConfig.HostBinariesOnMicrosoftUpdate
                UpstreamWsusServerName                        = $WsusConfig.UpstreamWsusServerName
                UpstreamWsusServerPortNumber                  = $WsusConfig.UpstreamWsusServerPortNumber
                UpstreamWsusServerUseSsl                      = $WsusConfig.UpstreamWsusServerUseSsl
                UseProxy                                      = $WsusConfig.UseProxy
                ProxyName                                     = $WsusConfig.ProxyName
                ProxyServerPort                               = $WsusConfig.ProxyServerPort
                UseSeparateProxyForSsl                        = $WsusConfig.UseSeparateProxyForSsl
                SslProxyName                                  = $WsusConfig.SslProxyName
                SslProxyServerPort                            = $WsusConfig.SslProxyServerPort
                AnonymousProxyAccess                          = $WsusConfig.AnonymousProxyAccess
                ProxyUserName                                 = $WsusConfig.ProxyUserName
                ProxyUserDomain                               = $WsusConfig.ProxyUserDomain
                HasProxyPassword                              = $WsusConfig.HasProxyPassword
                AllowProxyCredentialsOverNonSsl               = $WsusConfig.AllowProxyCredentialsOverNonSsl
                AllUpdateLanguagesEnabled                     = $WsusConfig.AllUpdateLanguagesEnabled
                AllUpdateLanguagesDssEnabled                  = $WsusConfig.AllUpdateLanguagesDssEnabled
                AllUpdateLanguagesUssEnabled                  = $WsusConfig.AllUpdateLanguagesUssEnabled
                LocalContentCachePath                         = $WsusConfig.LocalContentCachePath
                AutoRefreshUpdateApprovals                    = $WsusConfig.AutoRefreshUpdateApprovals
                AutoRefreshUpdateApprovalsDeclineExpired      = $WsusConfig.AutoRefreshUpdateApprovalsDeclineExpired
                AutoApproveWsusInfrastructureUpdates          = $WsusConfig.AutoApproveWsusInfrastructureUpdates
                DownloadUpdateBinariesAsNeeded                = $WsusConfig.DownloadUpdateBinariesAsNeeded
                DownloadExpressPackages                       = $WsusConfig.DownloadExpressPackages
                LogLevel                                      = $WsusConfig.LogLevel
                LogDestinations                               = $WsusConfig.LogDestinations
                LogRolloverFileSizeInBytes                    = $WsusConfig.LogRolloverFileSizeInBytes
                ClientEventExpirationTime                     = $WsusConfig.ClientEventExpirationTime
                ServerEventExpirationTime                     = $WsusConfig.ServerEventExpirationTime
                ExpiredEventDetectionPeriod                   = $WsusConfig.ExpiredEventDetectionPeriod
                ClientReportingLevel                          = $WsusConfig.ClientReportingLevel
                CollectClientInventory                        = $WsusConfig.CollectClientInventory
                DoDetailedRollup                              = $WsusConfig.DoDetailedRollup
                ServerString                                  = $WsusConfig.ServerString
                GetContentFromMU                              = $WsusConfig.GetContentFromMU
                MURollupOptin                                 = $WsusConfig.MURollupOptin
                MaximumAllowedComputers                       = $WsusConfig.MaximumAllowedComputers
                LocalPublishingMaxCabSize                     = $WsusConfig.LocalPublishingMaxCabSize
                DssAnonymousTargeting                         = $WsusConfig.DssAnonymousTargeting
                MaxDeltaSyncPeriod                            = $WsusConfig.MaxDeltaSyncPeriod
                AnonymousCookieExpirationTime                 = $WsusConfig.AnonymousCookieExpirationTime
                MaximumServerCookieExpirationTime             = $WsusConfig.MaximumServerCookieExpirationTime
                SimpleTargetingCookieExpirationTime           = $WsusConfig.SimpleTargetingCookieExpirationTime
                DssTargetingCookieExpirationTime              = $WsusConfig.DssTargetingCookieExpirationTime
                MaxCoreUpdatesPerRequest                      = $WsusConfig.MaxCoreUpdatesPerRequest
                MaxExtendedUpdatesPerRequest                  = $WsusConfig.MaxExtendedUpdatesPerRequest
                MaxUpdatesPerRequestInGetUpdateDecryptionData = $WsusConfig.MaxUpdatesPerRequestInGetUpdateDecryptionData
                DisableSyncPrinterCatalog                     = $WsusConfig.DisableSyncPrinterCatalog
                DisableSyncDrivers                            = $WsusConfig.DisableSyncDrivers
                MaxXmlPerRequest                              = $WsusConfig.MaxXmlPerRequest
                MaxXmlPerRequestInServerSync                  = $WsusConfig.MaxXmlPerRequestInServerSync
                DeploymentChangeDeferral                      = $WsusConfig.DeploymentChangeDeferral
                DisableNonCriticalDrivers                     = $WsusConfig.DisableNonCriticalDrivers
                MaxConcurrentDatabaseCalls                    = $WsusConfig.MaxConcurrentDatabaseCalls
                CategoryScanRequestTrackingReportingInterval  = $WsusConfig.CategoryScanRequestTrackingReportingInterval
                CategoryScanRequestTrackingMaxEntries         = $WsusConfig.CategoryScanRequestTrackingMaxEntries
                IsRegistrationRequired                        = $WsusConfig.IsRegistrationRequired
                ReportingServiceUrl                           = $WsusConfig.ReportingServiceUrl
                EventLogFloodProtectTime                      = $WsusConfig.EventLogFloodProtectTime
                RedirectorChangeNumber                        = $WsusConfig.RedirectorChangeNumber
                DownloadRegulationUrl                         = $WsusConfig.DownloadRegulationUrl
                DownloadRegulationWebServiceUrl               = $WsusConfig.DownloadRegulationWebServiceUrl
                LoadOdfLocally                                = $WsusConfig.LoadOdfLocally
                OdfFilePath                                   = $WsusConfig.OdfFilePath
                MUUrl                                         = $WsusConfig.MUUrl
                HandshakeAnchor                               = $WsusConfig.HandshakeAnchor
                ProxyPassword                                 = $WsusConfig.ProxyPassword
                ImportLocalPath                               = $WsusConfig.ImportLocalPath
                tateMachineTransitionLoggingEnabled           = $WsusConfig.tateMachineTransitionLoggingEnabled
                StateMachineTransitionErrorCaptureLength      = $WsusConfig.StateMachineTransitionErrorCaptureLength
                MaxSimultaneousFileDownloads                  = $WsusConfig.MaxSimultaneousFileDownloads
                BitsDownloadPriorityForeground                = $WsusConfig.BitsDownloadPriorityForeground
                BitsHealthScanningInterval                    = $WsusConfig.BitsHealthScanningInterval
                MaxNumberOfIdsToRequestDataFromUss            = $WsusConfig.MaxNumberOfIdsToRequestDataFromUss
                WsusInstallType                               = $WsusConfig.WsusInstallType
                SubscriptionFailureNumberOfRetries            = $WsusConfig.SubscriptionFailureNumberOfRetries
                SubscriptionFailureWaitBetweenRetries         = $WsusConfig.SubscriptionFailureWaitBetweenRetries
                LogFilePath                                   = $WsusConfig.LogFilePath
                DoServerSyncCompression                       = $WsusConfig.DoServerSyncCompression
                OobeInitialized                               = $WsusConfig.OobeInitialized
                HmDetectIntervalInSeconds                     = $WsusConfig.HmDetectIntervalInSeconds
                HmRefreshIntervalInSeconds                    = $WsusConfig.HmRefreshIntervalInSeconds
                HmCoreDiskSpaceGreenMegabytes                 = $WsusConfig.HmCoreDiskSpaceGreenMegabytes
                HmCoreDiskSpaceRedMegabytes                   = $WsusConfig.HmCoreDiskSpaceRedMegabytes
                HmCoreCatalogSyncIntervalInDays               = $WsusConfig.HmCoreCatalogSyncIntervalInDays
                HmClientsInstallUpdatesGreenPercent           = $WsusConfig.HmClientsInstallUpdatesGreenPercent
                HmClientsInstallUpdatesRedPercent             = $WsusConfig.HmClientsInstallUpdatesRedPercent
                HmClientsInventoryGreenPercent                = $WsusConfig.HmClientsInventoryGreenPercent
                HmClientsInventoryRedPercent                  = $WsusConfig.HmClientsInventoryRedPercent
                HmClientsInventoryScanDiffInHours             = $WsusConfig.HmClientsInventoryScanDiffInHours
                HmClientsSilentGreenPercent                   = $WsusConfig.HmClientsSilentGreenPercent
                HmClientsSilentRedPercent                     = $WsusConfig.HmClientsSilentRedPercent
                HmClientsSilentDays                           = $WsusConfig.HmClientsSilentDays
                HmClientsTooManyGreenPercent                  = $WsusConfig.HmClientsTooManyGreenPercent
                HmClientsTooManyRedPercent                    = $WsusConfig.HmClientsTooManyRedPercent
                HmCoreFlags                                   = $WsusConfig.HmCoreFlags
                HmClientsFlags                                = $WsusConfig.HmClientsFlags
                HmDatabaseFlags                               = $WsusConfig.HmDatabaseFlags
                HmWebServicesFlags                            = $WsusConfig.HmWebServicesFlags
                StatsDotNetWebServiceUri                      = $WsusConfig.StatsDotNetWebServiceUri
                StatsDotNetMaximumBatchSize                   = $WsusConfig.StatsDotNetMaximumBatchSize
                QueueFlushTimeInMS                            = $WsusConfig.QueueFlushTimeInMS
                QueueFlushCount                               = $WsusConfig.QueueFlushCount
                QueueRejectCount                              = $WsusConfig.QueueRejectCount
                DispatchMaximumSimultaneousHandlerCalls       = $WsusConfig.DispatchMaximumSimultaneousHandlerCalls
                SleepTimeAfterErrorInMS                       = $WsusConfig.SleepTimeAfterErrorInMS
                UseCookieValidation                           = $WsusConfig.UseCookieValidation
                DoReportingDataValidation                     = $WsusConfig.DoReportingDataValidation
                DoReportingSummarization                      = $WsusConfig.DoReportingSummarization
                RollupResetGuid                               = $WsusConfig.RollupResetGuid
                DssRollupChunkSize                            = $WsusConfig.DssRollupChunkSize
                RevisionDeletionTimeThreshold                 = $WsusConfig.RevisionDeletionTimeThreshold
                RevisionDeletionSizeThreshold                 = $WsusConfig.RevisionDeletionSizeThreshold
                ComputerDeletionTimeThreshold                 = $WsusConfig.ComputerDeletionTimeThreshold
            }
            subscription = @{
                SynchronizationProgress           = $wsusSubscription.GetSynchronizationProgress()
                SynchronizationStatus             = $wsusSubscription.GetSynchronizationStatus()
                UpdateCategories                  = $wsusSubscription.GetUpdateCategories()
                UpdateClassifications             = $wsusSubscription.GetUpdateClassifications()
                UpdateServer                      = $wsusSubscription.UpdateServer
                SynchronizeAutomatically          = $wsusSubscription.SynchronizeAutomatically
                SynchronizeAutomaticallyTimeOfDay = $wsusSubscription.SynchronizeAutomaticallyTimeOfDay
                LastModifiedTime                  = $wsusSubscription.LastModifiedTime
                LastModifiedBy                    = $wsusSubscription.LastModifiedBy
                LastSynchronizationTime           = $wsusSubscription.LastSynchronizationTime
                Anchor                            = $wsusSubscription.Anchor
                DeploymentAnchor                  = $wsusSubscription.DeploymentAnchor
                NumberOfSynchronizationsPerDay    = $wsusSubscription.NumberOfSynchronizationsPerDay
                IsCategoryOnlySync                = $wsusSubscription.IsCategoryOnlySync
            }
        }
    }
}
$SynchProgress = $wsusSubscription.GetSynchronizationProgress()
$result.ansible_facts.ansible_wsus.subscription.SynchronizationProgress += $SynchProgress


# Return result
Exit-Json -obj $result
