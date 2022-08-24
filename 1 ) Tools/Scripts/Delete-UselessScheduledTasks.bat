@echo off

:delete_action
	set list="\Microsoft\Windows\Application Experience\AitAgent"
	set list=%list%;"\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser"
	set list=%list%;"\Microsoft\Windows\Application Experience\ProgramDataUpdater" 
	set list=%list%;"\Microsoft\Windows\Application Experience\StartupAppTask"
	set list=%list%;"\Microsoft\Windows\WS\Badge Update"
	set list=%list%;"\Microsoft\Windows\WS\License Validation"
	set list=%list%;"\Microsoft\Windows\WS\Sync Licenses"
	set list=%list%;"\Microsoft\Windows\WS\WSTask"
	set list=%list%;"\Microsoft\Windows\WS\WSRefreshBannedAppsListTask"
	set list=%list%;"\Microsoft\Windows\WS\"
	set list=%list%;"\Microsoft\Windows\Workplace Join\Automatic-Workplace-Join"
	set list=%list%;"\Microsoft\Windows\Work Folders\Work Folders Logon Synchronization"
	set list=%list%;"\Microsoft\Windows\Work Folders\Work Folders Maintenance Work"
	set list=%list%;"\Microsoft\Windows\WOF\WIM-Hash-Management"
	set list=%list%;"\Microsoft\Windows\WOF\WIM-Hash-Validation"
	set list=%list%;"\Microsoft\Windows\WindowsUpdate\AUFirmwareInstall"
	set list=%list%;"\Microsoft\Windows\WindowsUpdate\AUScheduledInstall"
	set list=%list%;"\Microsoft\Windows\WindowsUpdate\AUSessionConnect"
	set list=%list%;"\Microsoft\Windows\WindowsUpdate\Scheduled Start"
	set list=%list%;"\Microsoft\Windows\WindowsUpdate\Scheduled Start With Network"
	set list=%list%;"\Microsoft\Windows\WindowsColorSystem"
	set list=%list%;"\Microsoft\Windows\Windows Media Sharing\UpdateLibrary"
	set list=%list%;"\Microsoft\Windows\Windows Error Reporting\QueueReporting"
	set list=%list%;"\Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance"
	set list=%list%;"\Microsoft\Windows\Windows Defender\Windows Defender Cleanup"
	set list=%list%;"\Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan"
	set list=%list%;"\Microsoft\Windows\Windows Defender\Windows Defender Verification"
	set list=%list%;"\Microsoft\Windows\WDI\ResolutionHost"
	set list=%list%;"\Microsoft\Windows\User Profile Service\HiveUploadTask"
	set list=%list%;"\Microsoft\Windows\Sysmain\HybridDriveCachePrepopulate"
	set list=%list%;"\Microsoft\Windows\Sysmain\HybridDriveCacheRebalance"
	set list=%list%;"\Microsoft\Windows\Sysmain\WsSwapAssessmentTask"
	set list=%list%;"\Microsoft\Windows\SoftwareProtectionPlatform\SvcRestartTask"
	set list=%list%;"\Microsoft\Windows\SoftwareProtectionPlatform\SvcRestartTaskLogon"
	set list=%list%;"\Microsoft\Windows\SoftwareProtectionPlatform\SvcRestartTaskNetwork"
	set list=%list%;"\Microsoft\Windows\SoftwareProtectionPlatform\SvcTrigger"
	set list=%list%;"\Microsoft\Windows\SkyDrive\Idle Sync Maintenance Task"
	set list=%list%;"\Microsoft\Windows\SkyDrive\Routine Maintenance Task"
	set list=%list%;"\Microsoft\Windows\Shell\IndexerAutomaticMaintenance"
	set list=%list%;"\Microsoft\Windows\SettingSync\BackgroundUploadTask"
	set list=%list%;"\Microsoft\Windows\SettingSync\BackupTask"
	set list=%list%;"\Microsoft\Windows\SettingSync\NetworkStateChangeTask"
	set list=%list%;"\Microsoft\Windows\Registry\RegIdleBackup"
	set list=%list%;"\Microsoft\Windows\RecoveryEnvironment\VerifyWinRE"
	set list=%list%;"\Microsoft\Windows\RAC\RacTask"
	set list=%list%;"\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem"
	set list=%list%;"\Microsoft\Windows\PerfTrack\BackgroundConfigSurveyor"
	set list=%list%;"\Microsoft\Windows\Offline Files\Background Synchronization"
	set list=%list%;"\Microsoft\Windows\Offline Files\Logon Synchronization"
	set list=%list%;"\Microsoft\Windows\MemoryDiagnostic\ProcessMemoryDiagnosticEvents"
	set list=%list%;"\Microsoft\Windows\MemoryDiagnostic\RunFullMemoryDiagnostic"
	set list=%list%;"\Microsoft\Windows\Maintenance\WinSAT"
	set list=%list%;"\Microsoft\Windows\Location\Notifications"
	set list=%list%;"\Microsoft\Windows\FileHistory\File History (maintenance mode)"
	set list=%list%;"\Microsoft\Windows\DiskFootprint\Diagnostics"
	set list=%list%;"\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector"
	set list=%list%;"\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver"
	set list=%list%;"\Microsoft\Windows\Diagnosis\Scheduled"
	set list=%list%;"\Microsoft\Windows\Defrag\ScheduledDefrag"
	set list=%list%;"\Microsoft\Windows\Customer Experience Improvement Program\BthSQM"
	set list=%list%;"\Microsoft\Windows\Customer Experience Improvement Program\Consolidator"
	set list=%list%;"\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask"
	set list=%list%;"\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip"
	set list=%list%;"\Microsoft\Windows\Chkdsk\ProactiveScan"
	set list=%list%;"\Microsoft\Windows\Autochk\Proxy"
	set list=%list%;"\Microsoft\Windows\AppxDeploymentClient\Pre-staged app cleanup"

	for %%A in (%list%) do (
		schtasks /delete /tn %%A /f
	)
	goto pause_exit
	
:main
	goto check_admin_perms

:check_admin_perms
	openfiles >nul 2>&1 
	if %errorlevel% == 1 (
		echo Please run this script as Administartor!
		goto pause_exit
	)
	goto delete_action
	
:pause_exit
	echo Press any key to close this window!
	pause>nul & exit