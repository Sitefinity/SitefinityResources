        $ErrorActionPreference  = "Stop";
        
        write-host "Starting setup…" -foregroundcolor yellow;
        
        #First check if .NET 4.0 is installed
     
        $net40Path = [System.IO.Path]::Combine($env:SystemRoot, "Microsoft.NET\Framework\v4.0.30319");
        $aspnetRegIISFullName = [System.IO.Path]::Combine($net40Path, "aspnet_regiis.exe");
     
        if ((test-path $aspnetRegIISFullName) -eq $false)
        {
            $message =  "aspnet_regiis.exe was not found in {0}. Make sure that Microsoft .NET Framework 4.0 is installed first." -f $net40Path;
            write-error $message;
        }
     
        write-host "Microsoft .NET Framework 4.0 appears to be installed." -foregroundcolor green;
     
        import-module ServerManager
     
        #Check for existence of required Windows features
     
        write-host "Checking for existance of required Windows features…" -foregroundcolor yellow
		get-windowsfeature MSMQ-Server,Web-Static-Content,Web-Default-Doc,Web-Dir-Browsing,Web-Http-Errors,Web-Asp-Net,Web-Net-Ext,Web-ISAPI-Ext,Web-ISAPI-Filter,Web-Http-Logging,Web-Request-Monitor,Web-Filtering,Web-Stat-Compression,Web-Dyn-Compression,Web-Mgmt-Console,Web-Scripting-Tools,Web-Mgmt-Service,NET-Framework-Core,NET-Win-CFAC,NET-HTTP-Activation,NET-Non-HTTP-Activ,RSAT-AD-PowerShell,RSAT-Web-Server,SNMP-Service,SNMP-WMI-Provider,Telnet-Client,WAS-Process-Model,WAS-NET-Environment,WAS-Config-APIs,Backup,Backup-Tools,Desktop-Experience
        write-host "All required features were found and can be enabled." -foregroundcolor green
     
	 
        #Install features
     
        write-host "Installing features…" -foregroundcolor yellow;
        add-windowsfeature MSMQ-Server,Web-Static-Content,Web-Default-Doc,Web-Dir-Browsing,Web-Http-Errors,Web-Asp-Net,Web-Net-Ext,Web-ISAPI-Ext,Web-ISAPI-Filter,Web-Http-Logging,Web-Request-Monitor,Web-Filtering,Web-Stat-Compression,Web-Dyn-Compression,Web-Mgmt-Console,Web-Scripting-Tools,Web-Mgmt-Service,NET-Framework-Core,NET-Win-CFAC,NET-HTTP-Activation,NET-Non-HTTP-Activ,RSAT-AD-PowerShell,RSAT-Web-Server,SNMP-Service,SNMP-WMI-Provider,Telnet-Client,WAS-Process-Model,WAS-NET-Environment,WAS-Config-APIs,Backup,Backup-Tools,Desktop-Experience
        write-host "Features installed." -foregroundcolor green;
     
        #Register ASP.NET 4.0 with IIS
     
        write-host "Registering ASP.NET 4.0 with IIS…" -foregroundcolor yellow;
        start-process -filepath $aspnetRegIISFullName  -argumentlist "-iru";
                  
        write-host "Setup complete." -foregroundcolor green;
     
    